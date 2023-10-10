import processing.serial.*;
import processing.net.*;
Serial p;
Server s;
Client c;

void setup(){
  p = new Serial(this, "COM4", 9600);
  s = new Server(this, 8074);
}
String m = "0";
void draw(){
  c = s.available();
  
  if(p.available()>0){
    m = p.readStringUntil('\n');
    if(m!=null){
      print(m);
    }
  }
  
  if(c != null){
    String w = c.readString();
    println(w);
    if (w.indexOf("GET") == 0) { // 스마트폰의 GET이 0.5초 마다 요청을 할 경우
      if(m.indexOf("0") == 0){
        m = "1";
      }
      else{
        m = "0";
      }
      c.write("HTTP/1.1 200 OK\r\n\r\n\r\n"); // POST 규격
      c.write(m);
    }
    c.stop();
  }
}
