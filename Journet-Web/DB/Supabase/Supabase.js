// import { Database } from './database.types';
// supabase 기본 설정
const supabase_url = "https://kimtuecthichjtenslli.supabase.co";
const supabase_key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtpbXR1ZWN0aGljaGp0ZW5zbGxpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTUxMzAxNTAsImV4cCI6MjAzMDcwNjE1MH0.i8gRNNi684LbanM6Ibxf-rcA5Q5ekcxhX53IHd_53HI";

const client = supabase.createClient(
  supabase_url, supabase_key
);

// 맵 기본 설정
var mapContainer = document.getElementById('map');
var Center = new kakao.maps.LatLng(36.6308081, 127.4866762);
var options = {
  center: Center,
  level: 6
};
let map = new kakao.maps.Map(mapContainer, options);

// 맵 클러스터 설정
let clusterer = {
  map: map,
  averageCenter: true,
  minLevel: 3
};

let pin_clusterer = new kakao.maps.MarkerClusterer(clusterer);

// 맵 세부 설정
map.setMaxLevel(6, { animate: true });
map.setZoomable(true);
map.setDraggable(true);

// 맵 축척 조절 바 생성
var control = new kakao.maps.ZoomControl();
map.addControl(control, kakao.maps.ControlPosition.BOTTOMRIGHT);

// 마커 기본 설정
// 생성자 함수 => 객체 > 배열
let map_pin = [];
let markers = [];
let iw_content = [];
let contents = [];

// DB 로딩하기
async function refrash_mappins() {

  let { data: pins, error } = await client.from("Mappins").select("*");
  console.log('pins', pins);

  function DB_pin(title, lat, lng, street, address) {
    this.title = title;
    this.latlng = new kakao.maps.LatLng(lat, lng);
    this.street = street;
    this.address = address;
    this.building = function () {
      return latlng;
    };
  };

  for (let pin of pins) {
    let db_pin = new DB_pin(pin.building_name, pin.latitude, pin.longitude, pin.street_address, pin.address);
    map_pin.push(db_pin);
  }

  for (let all_pin of map_pin) {
    // 마커 찍기
    var marker = new kakao.maps.Marker({
      map: map,
      position: all_pin.latlng,
    });
    markers.push(marker);

    var Content = `<div class="wrap">` +
      `    <div class="info">` +
      `        <div class="title">` +
      `            ${all_pin.title}` +
      `        </div>` +
      `        <div class="body">` +
      `            <div class="img">` +
      `                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">` +
      `           </div>` +
      `            <div class="desc">` +
      `                <div class="ellipsis">${all_pin.street}</div>` +
      `                <div class="jibun ellipsis">(지번) ${all_pin.address}</div>` +
      `            </div>` +
      `        </div>` +
      `    </div>` +
      `</div>`;

    // 마커 인포 생성
    var overlay = new kakao.maps.CustomOverlay({
      content: Content,
      map: map,
      position: marker.getPosition()
    });
    overlay.setMap(null);

    // 마커 이벤트 등록
    kakao.maps.event.addListener(marker, 'mouseover', mouse_over_listener(map, marker, overlay));
    kakao.maps.event.addListener(marker, 'mouseout', mouse_out_listener(overlay));

    // 마우스 호버시 마커 인포 노출
    function mouse_over_listener(map, marker, overlay) {
      return function () {
        overlay.setMap(map, marker);
      };
    }

    // 마우스 언호버시 마커인포 사라짐
    function mouse_out_listener(overlay) {
      return function () {
        overlay.setMap(null);
      };
    }
  }
  pin_clusterer.addMarkers(markers);
}
refrash_mappins();