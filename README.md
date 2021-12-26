# 자기소개
> TableView, ScrollView를 활용하여 만든 저를 소개하는 어플리케이션입니다.
 
### 🤖 구현 예시
---
|iPhone8 시뮬레이터로 구현한 예시|iPhone13 프로 시뮬레이터로 구현한 예시|
|---|---|
|![Simulator Screen Recording - iPhone 8 - 2021-12-26 at 11 38 59](https://bit.ly/311N9ae)|![Simulator Screen Recording - iPhone 13 Pro - 2021-12-26 at 11 51 13](https://bit.ly/3emBSEz)|

<br>

### 🤝 자기소개 
---
Scroll View를 활용하여 저에 대한 간단한 소개를 볼 수 있는 페이지입니다. 

자기소개 내용 

```swift
안녕하세요! iOS 개발자를 꿈꾸며 달려가고 있는 양호준입니다.
건국대학교 부동산학과를 졸업하고 서치펌, 부트캠프 등에서 HR 업무를 수행한 경험이 있습니다.
하지만 좀 더 다양한 사람들에게 가치를 줄 수 있는 일을 하고 싶다고 생각했고, 이에 가장 부합하는 것이 개발자라고 생각했습니다.
                    
그 중에서도 가장 처음 iOS 개발자를 선택한 이유는 단순히 Apple 제품이 좋아서였습니다.
iPad, iPhone, Macbook, apple watch, airpod Max, airpod Pro 등을 사용하며 만족했습니다.
단순히 하드웨어의 성능뿐만 아니라 소프트웨어도 깔끔하고 사용자 편의성을 많이 고려했다고 생각했습니다. 

따라서 내가 만족하며 사용하고 있는 디바이스에서 사람들에게 가치를 줄 수 있는 서비스를 만들 수 있다는 점이 특히 매력적이었습니다.
                    
또한 iOS에 대해 공부할수록 사용자가 어떻게 디바이스를 사용할 지 정말 많은 고민이 담겨있다는 것을 느낄 수 있었습니다.  
특히 Human Interface Guidelines를 보며 항상 사용자가 사용하기 편리한 인터페이스가 무엇인지 많은 고민이 녹여져있다는 것을 느낄 수 있었습니다.
이로 인해 안드로이드에 비해 iOS 앱의 완성도가 높다고 생각하는 사람들이 많다고 생각합니다.

이외에도 Accessibility를 통해 보다 많은 사람들이 어플리케이션을 편하게 사용할 수 있도록 노력하고 있다는 점도 인상적이었습니다. 
                    
그래서 지금 iOS 개발자가 되기 위해 야곰 아카데미에서 다양한 사람들과 협업을 진행하며 iOS 개발을 공부하고 있습니다. 
아직 부족한 점도 많지만 더욱 다양한 사람들에게 도움이 되는 어플리케이션을 만들고자 앞으로도 꾸준히 학습하는 개발자가 되고 싶습니다. 
```

<br>

### 🎓 출신학교 
---
현재 최종 학력을 보여주는 페이지입니다. 

전공 / 졸업연도 / 위치 정보를 보여주고 있습니다. 

<br>

### 💼 경력
---
테이블 뷰를 활용하여 각각의 경력을 볼 수 있도록 구현했습니다.

#### JSON 데이터 Parsing
경력 데이터의 경우 JSON 데이터를 따로 생성하여 파싱했습니다. 
이 때 단순히 decoding만 하기 때문에 Codable이 아닌 Decodable만 채택했습니다. 
또한 데이터를 받을 수 있도록 Experience 타입을 만들어 놓았습니다. 

```swift
struct JsonParser {
    func decode() throws -> [Experience] {
        guard let jsonAsset = NSDataAsset(name: "experienceData") else {
            throw ParsingError.fileNotFound
        }
        
        let jsonDecoder = JSONDecoder()
        
        guard let decodedData = try? jsonDecoder.decode([Experience].self, from: jsonAsset.data) else {
            throw ParsingError.failDecoding
        }
        
        return decodedData
    }
}
```

#### Cell의 데이터 전달
특정 경력을 터치했을 때 해당 경력의 description이 다음 ViewController로 넘어가야 했습니다. 
따라서 일단 다음 ViewController에 initializer를 만들어 놓았습니다. 

```swift
init?(coder: NSCoder, experience: Experience) {
    self.experience = experience
    super.init(coder: coder)
}
    
required init?(coder: NSCoder) {
    super.init(coder: coder)
}
```

그리고 ExperienceTableViewController에서 특정 셀을 눌렀을 때 화면이 넘어가도록 다음과 같이 구현했습니다. 
```swift
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let experience = self.experienceLists[indexPath.row]
        
    let experienceDetailStoryBoard = UIStoryboard(name: "ExperienceDetail", bundle: nil)
        
    let experienceDetailViewController = experienceDetailStoryBoard.instantiateViewController(identifier: "ExperienceDetail") { coder in
        ExperienceDetailTableViewController(coder: coder, experience: experience)
    }
        
    navigationController?.pushViewController(experienceDetailViewController, animated: true)
}
```

이 때 `instantiateViewController(identifier:, creator:)`를 사용하여  데이터를 전달할 수 있도록 구현했습니다. 

#### 경력 세부 
<details>
<summary>경력 세부 내용(토글을 누르시면 확인하실 수 있습니다)</summary>
<div markdown="1">

<details>
<summary>야곰아카데미 커리어 스타터 캠프</summary>
<div markdown="1">

기간: 2021.10 ~ 현재

```swift
5개의 팀 프로젝트를 진행한 경험이 있습니다. 현재에도 계속 추가적인 프로젝트를 진행 중입니다. 
Swift를 기반으로 iOS 앱 개발 관련 학습을 하고 있습니다. 클로저, 고차함수, 반복문, 조건문 등 Swift 문법은 물론 UIKit을 기반으로 한 앱 개발에 대해서 공부 중입니다. 
현재는 동시성 프로그래밍, Protocol Oriented Programming에 대해 중점적으로 공부 중입니다.

평소에는 모르는 부분이 있으면 Swift 공식문서, Apple Developer Documentation, Human Interface Guidelines를 통해 학습을 하고 있습니다. 따라서 영문 문서를 읽는 데에도 전혀 거부감이 없습니다. 

또한 현재 다른 사람들과 함께 '객체지향의 사실과 오해, 조영호'로 객체 지향에 대해서도 공부 중입니다. Swift 또한 객체 지향 언어인 만큼 이를 통해 객체 지향에 대한 이해도를 높이고 있는 중입니다.
```

</div>
</details>

<details>
<summary>코드스테이츠 커리어팀 Operation Manager (인턴)</summary>
<div markdown="1">

기간: 2021.05 ~ 2021.10

```swift
개발자 부트캠프인 코드스테이츠에서 수료생들을 대상으로 적합한 기업을 추천해주고, 이를 대상으로 진행하는 잡서칭 세션을 운영 및 관리하는 업무를 수행했습니다. 이 당시 Javascript 기반의 웹 프론트엔드 / 백엔드 개발자를 소싱하고 맞춤 추천하는 업무를 담당했습니다. 
또한 수료한 지 꽤 기간이 된 경우 경력직으로 개발자를 소싱하고 맞춤추천하는 업무를 담당했습니다. 이 때에는 Stibee라는 서비스를 활용해 공고를 홍보했습니다.

이외에도 zapier를 통해 구글 스프레드 시트에 설문 조사가 자동으로 반영되도록 자동화 업무도 진행했으며 세션에 직접 참여하여 수료생들을 대상으로 회사의 맞춤 추천 서비스를 소개하는 역할도 맡았습니다. 
수료생들의 취업 관련 데이터를 취합하여 데이터를 관리하고 분석하는 역할도 수행했으며, 세션 관련 피드백 또한 분석하고 새롭게 문항을 제작하는 업무도 수행했습니다.

이를 통해 개발자들의 취업 환경에 대해 배울 수 있었고 다양한 개발자와 소통해보며 개발에 대한 이해도를 높일 수 있었습니다. 이전에는 개발자에 대한 막연한 생각을 하고 있었다면, 이 업무를 통해 어떤 개발자가 되고 싶고, 어떻게 준비해야할 지를 깊이있게 고민해볼 수 있었던 좋은 경험이었습니다.
```
</div>
</details>

<details>
<summary>야곰아카데미 코드 스타터 캠프</summary>
<div markdown="1">

기간: 2021.08 ~ 2021.09

```swift
부트캠프에서 업무를 하면서, 직접 서비스를 제작하고 이를 유지보수하는 개발자가 되고 싶다고 생각했습니다. 하지만 아직 개발에 대한 경험이 없었기에 야곰아카데미에서 진행하는 코드 스타터 캠프를 수강했습니다. 
이와 더불어 처음으로 Swift Playgrounds라는 어플리케이션으로 코딩을 시작했습니다. 

Swift Playgrounds의 코딩 배우기 1, 2를 스스로 해보고 야곰아카데미를 통해 Swift 기본 문법(반복문, 조건문, 옵셔널, 에러처리, 타입 등)을 익히며, 어렵긴 했지만 내가 생각했던 것들이 실제로 콘솔 창에 구현되는 것을 보며 재미를 느낄 수 있었습니다. 
한 번도 공부를 하면서 재미있다고 생각한 적이 없었는데 프로그래밍은 공부라는 생각이 안 들고 즐거웠습니다.

따라서 개발이 정말 저에게 잘 맞는 것 같다고 생각했고, 커리어 전환을 해보자고 결심하게 된 계기가 되었습니다. 
```
</div>
</details>

<details>
<summary>오픈놀 미니인턴</summary>
<div markdown="1">

기간: 2020.09 ~ 2020.10

```swift
국내 게임회사인 네오위즈의 면접 방법을 기획하고 실제로 HR 실무진들에게 피드백을 받았습니다. 

오픈놀의 미니인턴 프로그램을 통해 실제로 실무진들이 해볼 수 있는 고민을 직접 해보고 자료 조사도 해보며 아이디어를 제안하고 기획서를 작성했습니다.
```
</div>
</details>

<details>
<summary>피티피플 리그장(기수 대표)</summary>
<div markdown="1">

기간: 2019.05 ~ 2020.05

```swift
연합 동아리인 피티피플에서 리그장으로서 1년간 동아리 활동을 했습니다. 

정해진 커리큘럼(주제)에 맞춰 다양한 발표 경험이 있습니다. 발표 주제는 전공, 취미, 음악 등 다양한 것들을 토대로 진행했습니다. 
또한 전문 심사위원들을 초빙한 연합 동아리 간 발표 대회에서도 발표자로 직접 참여하여 우수상을 수상한 경험이 있습니다.

이외에도 기수 장으로서 1년 간 동아리 운영을 했습니다. 분기 별로 동아리 원들의 피드백을 수렴 후 전체 운영 방안을 기획했으며, 신입 동아리원 면접도 2회 진행했습니다. 
이외에도 MT, 수료식 등 다양한 행사도 직접 기획하고 진행한 경험이 있습니다.
```
</div>
</details>

<details>
<summary>더라이징스타(현 헤딩) HR 3팀 인턴</summary>
<div markdown="1">

기간: 2019.09 ~ 2019.12

```swift
다양한 기업들의 요청에 맞춰 적합한 인재를 물색하고 직접 후보자에게 컨택하여 채용 제안을 해본 경험이 있습니다. 
3개월 동안 약 1,000명의 사람들과 직접 소통하며 해당 기업의 소개와 지원 의사를 물어보는 업무를 진행했습니다. 
이 과정에서 사람들과 어떻게 소통해야 설득을 할 수 있는지 고민해볼 수 있었습니다.

또한 이를 통해 다른 사람들의 인생에 중요한 직업을 찾아준다는 생각에 보람도 느낄 수 있었습니다.
```
</div>
</details>

</div>
</details>

<br>

### ⛓ 링크
---
SafariServices 프레임워크를 사용하여 Github, 블로그, LinkedIn에 바로 접속할 수 있도록 구현했습니다. 
