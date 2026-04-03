import SwiftUI

enum AppView: String, CaseIterable, Identifiable {
    case textAndModifiers = "01 - Text & Modifiers"
    case stacksAndSpacing = "02 - Stacks & Spacing"
    case imagesAndSymbols = "03 - Images & SF Symbols"
    case labels = "04 - Labels"
    case scrollView = "05 - ScrollView"
    case buttons = "06 - Button Styles"
    case toggles = "07 - Toggles"
    case lists = "08 - Lists"
    case formsAndSections = "09 - Forms & Sections"
    case groupBox = "10 - GroupBox"
    case forEachView = "11 - ForEach"
    case sliders = "12 - Sliders"
    case pickers = "13 - Picker Styles"
    case navigationStack = "14 - Navigation Stack"
    case sheets = "15 - Sheets"
    case tabView = "16 - Tab View"
    case tabViewPages = "17 - Tab View Pages"
    case menus = "18 - Menus"
    case semanticToolbars = "19 - Semantic Toolbars"
    case positionalToolbars = "20 - Positional Toolbars"
    case toolbarMenu = "21 - Toolbar Menu"
    case submitLabel = "22 - Keyboard Submit Label"
    case keyboardTypes = "23 - Keyboard Types"
    case pasteButton = "24 - Paste Button"
    case shareLink = "25 - Share Link"
    case animationsAndTransitions = "26 - Animations & Transitions"
    case searchable = "27 - Searchable"
    case loadingProgress = "28 - Loading Progress"
    case hapticFeedbacks = "29 - Haptic Feedbacks"
    case contentUnavailable = "30 - Content Unavailable"
    case charts = "31 - Charts"
    case mapKit = "32 - MapKit"
    case photosPicker = "33 - PhotosPicker"
    case tipKit = "34 - TipKit"
    case notifications = "35 - Notifications"
    case requestReview = "36 - Request Review"
    case webView = "37 - WebView"

    var id: String { rawValue }

    enum Category {
        case lessons, advancedFeatures, frameworks
    }

    var category: Category {
        switch self {
        case .charts, .mapKit, .photosPicker, .tipKit:
            return .advancedFeatures
        case .notifications, .requestReview, .webView:
            return .frameworks
        default:
            return .lessons
        }
    }

    static let lessons = allCases.filter { $0.category == .lessons }
    static let advancedFeaturesCases = allCases.filter { $0.category == .advancedFeatures }
    static let frameworks = allCases.filter { $0.category == .frameworks }
}

struct ViewPickerContainer: View {
    @State private var selectedView: AppView = .textAndModifiers

    var body: some View {
        NavigationStack {
            selectedViewContent
                .toolbar {
                    if selectedView != .semanticToolbars && selectedView != .positionalToolbars {
                        ToolbarItem(placement: .primaryAction) {
                            Menu {
                                Picker("Select Lesson", selection: $selectedView) {
                                    ForEach(AppView.lessons) { view in
                                        Text(view.rawValue).tag(view)
                                    }
                                }

                                Divider()

                                Menu("Advanced Features") {
                                    Picker("Select Feature", selection: $selectedView) {
                                        ForEach(AppView.advancedFeaturesCases) { view in
                                            Text(view.rawValue).tag(view)
                                        }
                                    }
                                }

                                Menu("Frameworks") {
                                    Picker("Select Framework", selection: $selectedView) {
                                        ForEach(AppView.frameworks) { view in
                                            Text(view.rawValue).tag(view)
                                        }
                                    }
                                }
                            } label: {
                                Label("Lesson Picker", systemImage: "rectangle.stack")
                            }
                        }
                    }
                }
                .navigationTitle(selectedView.rawValue)
                .navigationBarTitleDisplayMode(.inline)
        }
    }

    @ViewBuilder
    private var selectedViewContent: some View {
        switch selectedView {
        case .textAndModifiers:
            TextAndModifiersView()
        case .stacksAndSpacing:
            StacksAndSpacingView()
        case .imagesAndSymbols:
            ImagesAndSFSymbolsView()
        case .labels:
            LabelsView()
        case .scrollView:
            ScrollViewExampleView()
        case .toggles:
            TogglesView()
        case .lists:
            ListsView()
        case .formsAndSections:
            FormsAndSectionsView()
        case .groupBox:
            GroupBoxView()
        case .forEachView:
            ForEachExampleView()
        case .sliders:
            SlidersView()
        case .pickers:
            PickersView()
        case .submitLabel:
            KeyboardSubmitLabelView()
        case .keyboardTypes:
            KeyboardTypesView()
        case .pasteButton:
            PasteButtonView()
        case .shareLink:
            ShareLinkView()
        case .navigationStack:
            NavigationStackExampleView()
        case .sheets:
            SheetsView()
        case .tabView:
            TabBarView()
        case .tabViewPages:
            TabViewPagesView()
        case .menus:
            MenusView()
        case .semanticToolbars:
            SemanticToolbarsView { selectedView = .textAndModifiers }
        case .positionalToolbars:
            PositionalToolbarsView { selectedView = .textAndModifiers }
        case .toolbarMenu:
            ToolbarMenuView()
        case .animationsAndTransitions:
            AnimationsAndTransitionsView()
        case .searchable:
            SearchableView()
        case .loadingProgress:
            LoadingProgressView()
        case .hapticFeedbacks:
            HapticFeedbacksView()
        case .contentUnavailable:
            ContentUnavailableExampleView()
        case .charts:
            ChartsView()
        case .mapKit:
            MapKitView()
        case .photosPicker:
            PhotosPickerView()
        case .tipKit:
            TipKitView()
        case .notifications:
            UserNotificationsView()
        case .requestReview:
            RequestReviewView()
        case .webView:
            WebContentView()
        case .buttons:
            ButtonsView()
        }
    }
}
