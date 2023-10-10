void setup() {
  // 시리얼 통신을 초기화하고 통신 속도를 9600으로 설정합니다.
  Serial.begin(9600);
  
  // 디지털 핀 13을 출력 모드로 설정합니다.
  pinMode(13, OUTPUT);
  
  // 디지털 핀 11을 입력 풀업 모드로 설정합니다.
  pinMode(11, INPUT_PULLUP);
}

void loop() {
  // 디지털 핀 11의 상태를 읽어와서 변수 sw에 저장합니다.
  int sw = digitalRead(11);
  
  // sw 변수의 값을 시리얼 모니터를 통해 출력합니다.
  Serial.println(sw);
  
  // 500 밀리초(0.5초) 동안 대기합니다.
  delay(500);

  // 만약 스위치가 HIGH(눌림) 상태라면
  if(sw == HIGH){
    // 디지털 핀 13을 LOW(끈 상태)로 설정합니다.
    digitalWrite(13, LOW);
  }
  // 스위치가 LOW(눌리지 않음) 상태라면
  else{
    // 디지털 핀 13을 HIGH(켠 상태)로 설정합니다.
    digitalWrite(13, HIGH);
  }
}