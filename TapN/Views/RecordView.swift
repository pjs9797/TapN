import SwiftUI

struct RecordView: View {
    @Environment(\.managedObjectContext) private var managedObjectContext
    @EnvironmentObject var languageManager: LanguageManager
    @StateObject private var recordViewModel = RecordViewModel()
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "prColor06")
        let attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor : UIColor.white,
            .font: UIFont(name: "Chalkboard SE", size: 18*Constants.standartFont)
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                HStack(alignment: .center){
                    BackButton()
                        .padding(.top, -13*Constants.standardHeight)
                    Spacer()
                }
                Text(languageManager.localizedString(forKey: "랭킹"))
                    .foregroundColor(ThemeManager.Colors.prColor06)
                    .font(ThemeManager.Fonts.GaeguBold(size: 40*Constants.standartFont))
                    .frame(maxWidth: .infinity)
            }
            Picker("",selection: $recordViewModel.selectedType,
                   content: {
                Text("1 To 9").tag("1 To 9")
                Text("1 To 16").tag("1 To 16")
                Text("1 To 25").tag("1 To 25")
            })
            .pickerStyle(SegmentedPickerStyle())
            .background(ThemeManager.Colors.bgColor)
            .scaledToFit()
            .frame(height: 70*Constants.standardHeight)
            .scaledToFit()
            .scaleEffect(CGSize(width: 1, height: 1.4))
            .onChange(of: recordViewModel.selectedType) { _ in
                recordViewModel.loadRecords(using: managedObjectContext)
            }
            List {
                ForEach(Array(recordViewModel.records.enumerated()), id: \.element) { index, record in
                    HStack{
                        Spacer()
                        Text("\(index+1)")
                            .foregroundColor(ThemeManager.Colors.prColor06)
                            .font(ThemeManager.Fonts.Chalkboard(size: 50*Constants.standartFont))
                            .padding(.bottom, 5*Constants.standardHeight)
                        Spacer()
                        Text(record.value(forKey: "record") as? String ?? "Unknown Record")
                            .font(ThemeManager.Fonts.Chalkboard(size: 40*Constants.standartFont))
                            .foregroundColor(ThemeManager.Colors.prColor05)
                        Spacer()
                        Text(recordViewModel.formatDate(record.value(forKey: "date") as? Date))
                            .font(ThemeManager.Fonts.GaeguRegular(size: 20*Constants.standartFont))
                        Spacer()
                    }
                    .listRowBackground(ThemeManager.Colors.bgColor)
                    .listRowInsets(EdgeInsets())
                }
            }
            .listStyle(.plain)
            .background(ThemeManager.Colors.bgColor)
            .scrollContentBackground(.hidden)
            .onAppear {
                recordViewModel.loadRecords(using: managedObjectContext)
            }
            Spacer()
        }
        .background(ThemeManager.Colors.bgColor)
        .navigationBarHidden(true)
    }
}

struct Previews_RecordView: PreviewProvider {
    static var previews: some View {
        let gameDataManager = GameDataManager(inMemory: true)
        let context = gameDataManager.container.viewContext
        
        gameDataManager.insertMockData(context: context)
        gameDataManager.insertMockData(context: context)
        
        return ForEach(["iPhone SE (3rd generation)", "iPhone 15 Pro"], id: \.self) { deviceName in
            RecordView()
                .environment(\.managedObjectContext, context)
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}

