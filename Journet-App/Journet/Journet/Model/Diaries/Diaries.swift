import Combine
import ActivityKit

final class Diaries: ObservableObject {
    @Published var num: Int = 0
    
    private var cancellable: Set<AnyCancellable> = Set()
    private var activity: Activity<DynamicIsiandWidgetAttributes>?
    
    func onLiveActivity() {
        // 앱이 live activity사용 가능한지여부
        guard ActivityAuthorizationInfo().areActivitiesEnabled else { return }
        let attribute = DynamicIsiandWidgetAttributes(name: "나미야 잡화점의 기적")
        // stateful한 값
        let state = DynamicIsiandWidgetAttributes.ContentState(value: 0)
        do {
            self.activity = try Activity.request(attributes: attribute, contentState: state)
        } catch {
            print(error)
        }
    }
    
    func offLiveActivity() {
        Task {
            // final dynamic content정의, 디폴트, 즉시종료, date후 종료 설정가능
            await activity?.end(using: nil, dismissalPolicy: .default)
            cancellable.removeAll()
        }
    }
}
