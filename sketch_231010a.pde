import processing.serial.*; // 시리얼 통신 라이브러리 임포트
import processing.net.*; // 네트워크 통신 라이브러리 임포트

Server s; // 서버 객체
Client c; // 클라이언트 객체
Serial p; // 시리얼 통신 객체

void setup() {
  // 시리얼 포트 설정: COM4 포트, 9600 보드 속도
  p = new Serial(this, "COM4", 9600);
  
  // 서버 객체 생성: 포트 12345를 사용하는 서버 생성
  s = new Server(this, 12345);
}

void draw() {
  // 서버에서 클라이언트 연결 확인
  c = s.available();
  
  // 만약 클라이언트가 연결되어 있다면
  if (c != null) {
    // 클라이언트로부터 문자열 읽기
    String m = c.readString();
    
    // 문자열의 마지막 문자 추출
    m = m.substring(m.length() - 1);
    
    // 시리얼 포트를 통해 읽은 문자열 전송
    p.write(m);
    
    // 만약 문자열에 '1'이 포함되어 있다면 배경을 빨간색으로 설정
    if (m.indexOf("1") == 0) {
      background(255, 0, 0);
    }
    
    // 만약 문자열에 '0'이 포함되어 있다면 배경을 파란색으로 설정
    if (m.indexOf("0") == 0) {
      background(0, 0, 255);
    }
  }
}
