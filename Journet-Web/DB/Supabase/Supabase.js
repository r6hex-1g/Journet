
// import { Database } from './database.types';

const supabase_url = "https://kimtuecthichjtenslli.supabase.co";
const supabase_key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtpbXR1ZWN0aGljaGp0ZW5zbGxpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTUxMzAxNTAsImV4cCI6MjAzMDcwNjE1MH0.i8gRNNi684LbanM6Ibxf-rcA5Q5ekcxhX53IHd_53HI";

const client = supabase.createClient(
  supabase_url, supabase_key
);

// 맵 관련 코드
async function refrash_mappins() {
  let { data: record, error } = await client.from("Mappins").select("*");
  // 맵 기본 설정
  var mapContainer = document.getElementById('map');
  var Center = new kakao.maps.LatLng(36.6364883, 127.4836014);
  var options = {
    center: Center,
    level: 7
  };

  var map = new kakao.maps.Map(mapContainer, options);

  // 마커 배열화
  let mappin = [
    {
      building_name: ``,
      locations: new kakao.maps.LatLng()
    },
  ];

  // 마커 설정
  var marker = new kakao.maps.Marker({
    map: mapContainer,
    position: mappin.locations
  });

  // 마우스 클릭 이벤트 설정
  kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
    var latlng = mouseEvent.latLng;
    marker.setPosition(latlng);
  });

  // 맵 세부 설정
  map.setMaxLevel(7, { animate: true });
  map.setZoomable(true);
  map.setDraggable(true);

  // 맵 축척 조절 바 생성
  var control = new kakao.maps.ZoomControl();
  map.addControl(control, kakao.maps.ControlPosition.BOTTOMRIGHT);
  console.log('record', record);
};
refrash_mappins();

async function record_handler() {
  let { data, error } = await client
    .from("Mappins")
    .insert([{ building_name: prompt("name?"), latitude: prompt("latitude?"), longitude: prompt("longitude?") }]);
  refrash_mappins();
}
document
  .querySelector('')
  .addEventListener("click", record_handler);