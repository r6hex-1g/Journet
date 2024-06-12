// supabase 기본 설정
const supabase_url = "https://kimtuecthichjtenslli.supabase.co";
const supabase_key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtpbXR1ZWN0aGljaGp0ZW5zbGxpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTUxMzAxNTAsImV4cCI6MjAzMDcwNjE1MH0.i8gRNNi684LbanM6Ibxf-rcA5Q5ekcxhX53IHd_53HI";

const client = supabase.createClient(
  supabase_url, supabase_key
);

// 맵 기본 설정
var mapContainer = document.getElementById('full_map');
var Center = new kakao.maps.LatLng(36.631786, 127.481600);
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
// 현위치 가져오기 설정
if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition(function (position) {
    var lat = position.coords.latitude, // 경도 가져오기
      lon = position.coords.longitude; // 위도 가져오기

    var loc_position = new kakao.map.LatLng(lat, lon),
      message = '<div style="padding:5px;">여기에 계신가요?!</div>';

    displayMarker(loc_position, message);
  });
} else {
  var loc_position = new kakao.map.LatLng(36.6350459, 127.4578066),
    message = '현재 위치를 가져올 수 없어요. 다시 시도해주세요.';

  displayMarker(loc_position, message);
}

function displayMarker(loc_position, message) {

  // 마커 생성
  var loc_marker = new kakao.maps.marker({
    map: map,
    position: loc_position
  });

  var info_content = message, // 마커 인포윈도우에 표시할 내용
    info_removeable = true;

  //  인포윈도우 생성
  var info_window = kakao.maps.Infowindow({
    content: info_content,
    removeable: info_removeable
  });

  // 윈포윈도우를 마커 위에 표시
  info_window.open(map, loc_marker);
}

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