# WorldPostOfficeHome

SwiftUI로 구현한 `구름 고양이의 작은 모험` 홈 화면 프로토타입입니다.

## 요구 환경

- Xcode 16.4 이상
- iOS 17.0 이상
- XcodeGen 2.45.x 권장

## 프로젝트 생성 및 실행

```bash
brew install xcodegen
xcodegen generate
open WorldPostOfficeHome.xcodeproj
```

Xcode에서 `WorldPostOfficeHome` 공유 스킴과 iPhone Simulator를 선택한 뒤 실행합니다. 시뮬레이터 빌드와 테스트는 코드 서명 없이 동작하도록 CI가 구성되어 있습니다.

## 테스트

```bash
xcodegen generate
xcodebuild \
  -project WorldPostOfficeHome.xcodeproj \
  -scheme WorldPostOfficeHome \
  -destination 'platform=iOS Simulator,name=iPhone 16 Pro' \
  CODE_SIGNING_ALLOWED=NO \
  test
```

테스트 구성:

- `WorldPostOfficeHomeTests`
  - 핵심 레이아웃 토큰과 진행률 범위 검사
- `WorldPostOfficeHomeUITests`
  - 앱 실행
  - 익명 프로필, 시스템 퀘스트 CTA, 진행 중 교환 카드 존재 여부 확인
  - 홈 화면 스크린샷을 `.xcresult`에 첨부

## GitHub Actions

`.github/workflows/ios-ci.yml`에서 다음을 실행합니다.

1. macOS 15 runner와 Xcode 16.4 선택
2. XcodeGen으로 프로젝트 및 공유 스킴 생성
3. 코드 서명 없는 iOS Simulator 빌드
4. 사용 가능한 iPhone Simulator 동적 탐색
5. 단위 테스트와 UI 테스트 실행
6. 한국어·라이트 모드로 홈 화면 캡처
7. 빌드 로그, 테스트 로그, `.xcresult`, 테스트 요약, PNG를 artifact로 업로드

## 구현 구조

- `DesignSystem/DesignTokens.swift`
  - 색상, 여백, radius, 그림자, 폰트 토큰
- `Features/Home/HomeComponents.swift`
  - 사용자 헤더
  - 월드 포스트 오피스 배지
  - 오늘의 퀘스트 카드
  - 우표 에너지 진행 카드
  - 진행 중 교환 카드
  - 빠른 메뉴
  - 하단 탭바
- `Features/Home/HomeIllustrations.swift`
  - 고양이 아바타, 우체부 장면, 식물 폴라로이드, 도쿄 엽서를 순수 SwiftUI로 구성
- `Features/Home/HomeView.swift`
  - 홈 화면 조립 및 스크롤 구조

## 레퍼런스에 가깝게 조정하는 방법

기준 스크린샷과 GitHub Actions에서 생성된 `Screenshots/home.png`를 나란히 비교하면서 다음 값을 수정합니다.

- 전체 간격: `HomeView.swift`
- 색상과 radius: `DesignTokens.swift`
- 카드 높이와 내부 배치: `HomeComponents.swift`
- 일러스트 크기와 위치: `HomeIllustrations.swift`의 `frame`, `offset`, `scaleEffect`

원본은 9:16 비율이고 실제 iPhone 화면은 더 세로로 길기 때문에, 원본 비율을 유지하면서 실제 앱에서는 스크롤되는 구조로 구현했습니다.

## 현재 범위

- 홈 UI와 컴포넌트 구현
- SwiftUI 단위/UI 스모크 테스트
- GitHub Actions 기반 Xcode 빌드·테스트·스크린샷 캡처
- 버튼 네비게이션과 서버 연동은 미구현
- 현재 일러스트는 CI 재현성이 높은 순수 SwiftUI 프로토타입이며, 정식 앱에서는 동일 컴포넌트 경계를 유지한 채 마스터 벡터·래스터 에셋으로 교체 가능
