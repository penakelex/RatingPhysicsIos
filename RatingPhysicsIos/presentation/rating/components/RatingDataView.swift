import SwiftUI

struct RatingDataView: View {
    let ratingData: RatingData
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                LazyVStack(alignment: .leading){
                    ForEach(self.ratingData.toList(), id: \.0) { (name, value) in
                        Text("\(name): ")
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                        + Text(value)
                            .font(.system(size: 22))
                    }
                    
                    ListDataView(header: String(localized: "practical_lessons_label"), data: self.ratingData.practicalLessonsToStrings())
                    
                    ListDataView(header: String(localized: "cgt_label"), data: self.ratingData.cgts.map({cgt in
                        cgt == nil ? String(localized: "no_data_label") : String(cgt!)
                    }))
                }
            }
        }
    }
}

extension RatingData {
    func toList() -> [(String, String)] {
        return [
            (String(localized: "full_name_label"), self.fullName),
            (String(localized: "group_label"), self.group),
            (String(localized: "summary_label"), String(self.summary)),
            (String(localized: "rating_group_label"), String(self.ratingGroup)),
            (String(localized: "rating_flow_label"), String(self.ratingFlow)),
            (String(localized: "colloquium_label"), self.colloquium == nil ? "Нет данных" : String(self.colloquium!)),
            (String(localized: "cgt_cw_label"), String(self.cgtCw)),
            (String(localized: "lw_label"), self.lw == nil ? String(localized: "no_data_label") : String(self.lw!)),
            (String(localized: "it_label"), self.it == nil ? String(localized: "no_data_label") : String(self.it!)),
            (String(localized: "nirs_label"), self.nirs == nil ? String(localized: "no_data_label") : String(self.nirs!)),
            (String(localized: "essay_label"), self.essay == nil ? String(localized: "no_data_label") : String(self.essay!)),
            (String(localized: "sum_practice_label"), String(self.sumPractice)),
            (String(localized: "omissions_label"), String(self.omissions)),
        ]
    }
    
    func practicalLessonsToStrings() -> [String] {
        return self.practicalLessons.map({ lesson in
            var builder = String()
            
            builder.append(lesson.tasks == nil ? String(localized: "no_data_label") : String(lesson.tasks!))
            
            if lesson.notAttend {
                builder.append(" (\(String(localized: "was_not_on_the_lesson_label"))")
            }
            
            return builder
        })
    }
}
