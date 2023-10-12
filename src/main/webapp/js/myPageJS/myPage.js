// <script>
//     // 초기 tab-content hidden 설정
//     const allTabContents = document.querySelectorAll(".tab-content");
//     allTabContents.forEach((content) => {
//     content.style.display = "none";
// });
//
//     // 탭 링크로 변경함
//     const tabs = document.querySelectorAll(".mytab-link");
//
//     // 탭링크 클릭시 함수
//     tabs.forEach((tab) => {
//     tab.addEventListener("click", (event) => {
//         event.preventDefault();
//
//         // 탭링크 초기화
//         tabs.forEach((t) => {
//             t.style.borderBottom = "none";
//         });
//
//         // 클릭시  탭 부분 경계 강조
//         tab.style.borderBottom = "5px solid white";
//
//         // 탭 컨텐츠 토글 적용 경우
//         const targetTabId = tab.getAttribute("href").substring(1);
//         const targetTabContent = document.getElementById(targetTabId);
//
//         if (targetTabContent.style.display === "block") {
//             targetTabContent.style.display = "none";
//         } else {
//             // 다른 탭 컨텐츠 안보이게 적용
//             const allTabContents = document.querySelectorAll(".tab-content");
//             allTabContents.forEach((content) => {
//                 content.style.display = "none";
//             });
//
//             // 선택 탭 컨텐츠 보이게 적용
//             targetTabContent.style.display = "block";
//         }
//     });
// });
// </script>