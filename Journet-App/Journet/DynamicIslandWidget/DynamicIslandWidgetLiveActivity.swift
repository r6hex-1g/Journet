import ActivityKit
import WidgetKit
import SwiftUI

struct DynamicIsiandWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var value: Int
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
    var totalNum = 100.0
}

struct DynamicIsiandWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DynamicIsiandWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack(alignment: .leading) {
                Text("잠금화면 테스트")
                Text("책 이름: '\(context.attributes.name)'")
                Text("읽은 페이지: \(context.state.value)")
            }
            .padding(.leading, 5)
            .activityBackgroundTint(Color.gray)
            .activitySystemActionForegroundColor(Color.pink)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("M")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension DynamicIsiandWidgetAttributes {
    fileprivate static var preview: DynamicIsiandWidgetAttributes {
        DynamicIsiandWidgetAttributes(name: "World")
    }
}

extension DynamicIsiandWidgetAttributes.ContentState {
    fileprivate static var smiley: DynamicIsiandWidgetAttributes.ContentState {
        DynamicIsiandWidgetAttributes.ContentState(value: 0)
     }
     
     fileprivate static var starEyes: DynamicIsiandWidgetAttributes.ContentState {
         DynamicIsiandWidgetAttributes.ContentState(value: 0)
     }
}

#Preview("Notification", as: .content, using: DynamicIsiandWidgetAttributes.preview) {
   DynamicIsiandWidgetLiveActivity()
} contentStates: {
    DynamicIsiandWidgetAttributes.ContentState.smiley
    DynamicIsiandWidgetAttributes.ContentState.starEyes
}
