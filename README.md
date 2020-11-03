# DHK iOS팀 Coding Test
📝 다음 제공되는 API를 기반으로 레스토랑 목록과 찜기능, 찜목록이 있는 화면을 만듭니다.

⏱ 제한시간은 24시간 입니다. 실제로 구현하는데 필요한 시간보다 넉넉하게 제공되었습니다.


## 요구사항
- 아래에 제공된 API를 이용해 레스토랑 데이터를 가져옵니다. (3페이지 까지 제공)
- 레스토랑 클릭시 찜목록에 추가/삭제가 되도록 합니다. 찜목록은 로컬에 저장해 주세요. 앱을 껐다켜도 유지가 되어야 합니다.
- 데이터의 모든 키가 활용됩니다.
- 디자인은 스크린샷을 참고하시면 됩니다.
- 수치나 UI 구성에 관련해서는 자유롭게 만들어주세요.
- 목록의 섹션은 `sectionTitle`키의 value로 그룹핑하면 됩니다.
- 3rd-party library는 자유롭게 사용 가능합니다.
- 테스트코드 추가시 가산점이 있습니다.


## json 데이터 키 설명
- `logoUrl` - 레스토랑 썸네일 이미지 url
- `name` - 화면에 표시되는 레스토랑 이름
- `reviewAvg` - 리뷰 평균 점수
- `reviewCount` - 리뷰 갯수, 0일 경우에는 '첫번째 리뷰를 남겨주세요!'라는 텍스트가 노출
- `ownerReplyCount` - 사장님이 단 댓글 수, 0일 경우 표시되지 않음
- `sectionTitle` - 그룹핑된 데이터의 섹션의 화면에 표시되는 텍스트
- `isPhoneOrderAvailable` - 전화주문 아이콘 노출 여부
- `payment` - 요기요결제, 현장결제 가능 여부, `yogiseo`값이 들어있으면, 요기서결제 아이콘이 노출되고, `offline`이라는 값이 들어있으면 현장결제 아이콘이 노출
- `isAvailablePickup` - 테이크아웃 아이콘 노출 여부
- `deliveryMethod` - `OD/VD`. `OD`일 경우 요기요익스프레스 아이콘이 노출


## API
- https://beomcheol.github.io/ios-codding-test-resources/restaurants/1/restaurant.json
- https://beomcheol.github.io/ios-codding-test-resources/restaurants/2/restaurant.json
- https://beomcheol.github.io/ios-codding-test-resources/restaurants/3/restaurant.json


## Screen Shot
<img src="https://raw.githubusercontent.com/beomcheol/ios-codding-test-resources/master/screen-shots/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-09-15%20at%2010.32.32.png" width=320> <img src="https://raw.githubusercontent.com/beomcheol/ios-codding-test-resources/master/screen-shots/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-09-15%20at%2010.32.37.png" width=320> <img src="https://raw.githubusercontent.com/beomcheol/ios-codding-test-resources/master/screen-shots/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-09-15%20at%2010.43.52.png" width=320>
# TabExample
