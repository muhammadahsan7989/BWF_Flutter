Dart Practice:

1. Variables and $ sign importance:

void main() {
  
  String greeting = 'hello how are you doing';
  print(greeting);
  greeting = "my monthly salary is around: \$500"  ;
  
  print(greeting);
  
}

2. var, const and final:

void main() {
  
  var value = 11; // value can be change
  print(value);
  
  final value1 = 'ahsan'; // Immutable
  print(value1);
  
  const value3 = 23;
  
  print(value3);
// var are mutable whereas final(runtime const) and const(compiletime const) are immutable
  
  
}

3. if else statements:

void main() {
  
  int marks = 3;
   if (marks >= 7){
     print('excellent');
   }
  else if (marks >= 4){
    print('fair');
   
  }
  else {
   print('fail');
  }
}

4. nested if else

void main() {
  
  int number = 0;
  if(number != 0){
     if(number>0){
       print('number is positve');
     }
    else{
      print('number is negative');
    }
   }
  else{
    print('number is zero so its either positve or negative');
    
  }
  
}

5. for loop
void main() {
  for (int i = 0; i < 10; i++) {
    print('hello ${i + 1}');
  }
}
6. while loop
void main() {
  String value= 'Hello';
  
  int i = 0;
  while(i<value.length){
    print(value[i]);
    i = i+1;
  }
}
7. do while loop
void main() {
  String value= 'Hello';
  
  int i = 0;
  
  do{
    print(value[i]);
    i++;
  }
  while(i<value.length);
}
8. Function to return 2 records
void main() {
  var name = printname();
  
  print(name);
  }
 (int,String) printname(){
    return (12,'Ahsan');
}

9. Classes
void main(){
  //Cook().baking();
  //print(Cook().bowl);
  //print(Cook().isfinished());
  final cookie = Cook('Rect',20.0); // object 
  print(cookie.shape);
  print(cookie.size);
}

class Cook{
   String shape;
    double size;
    
  Cook(this.shape,this.size){ //Contructor
       baking();
    print("start asap");
    
    
   
  }
   //gram
  
  void baking(){ // method
    print('Cooking started');
  }
  bool isfinished(){
    return false;
    
  }
  
}
10. Getter / Setter

void main() {
  Cook cookie = Cook();
 // cookie.baking(); 
  print(cookie.height); 
 // print(cookie.isfinished());
  cookie.Modifyheight(20); 
  print(cookie._height); 
}

class Cook {
  int _height = 10; 
  int _width = 6; 
  
  int get height => _height;// getter

  
  void Modifyheight(int h) {
    _height = h;
  } 

  
  void baking() {
    print('Cooking started');
  }

  
  bool isfinished() {
    return false;
  }
}
----------------
setter-----
void main() {
  Cook cookie = Cook();
  // cookie.baking();
  print(cookie.height);
  // print(cookie.isfinished());
 // cookie.Modifyheight(20);
  print(cookie.height);
  cookie.setHeight = 12;
  print(cookie.height);
}

class Cook {
  int _height = 10;
  int _width = 6;

  int get height => _height; // getter

  set setHeight (int h) {
     _height = h;
  }
  

  void baking() {
    print('Cooking started');
  }

  bool isfinished() {
    return false;
  }
}
11. Statics
void main() {
  //final constant  =  Constants();
  print(Constants.greeting); 
  print(Constants.bye);

}


class Constants {
  Constants(){
    print('anything');
  }
  
  static String greeting = 'Hello how are you?';
  static String bye = 'Bye!';
}

12. Inheritance:
void main() {
  Vehicle car = Car();
  print(car.isLighton);
  print((car as Car).wheel);
  
  Truck tru = Truck();
  print(tru.isStartedEngine);
  print(tru.wheel);


}

class Vehicle{
  int speed = 10;
  bool isStartedEngine = false;
  bool isLighton = true;
  
  void accelerate(){
    speed += 10;
  }
  
}

class Car extends Vehicle{
  int wheel = 4;
  
  void something(){
    print(wheel);
  }
  
  
}
class Truck extends Vehicle{
  int wheel = 8;
  
  void something(){
    print(wheel);
  }
  
  
}

13. Polymorphism
void main(){
  
  animal catt = cat();
  animal dogg = dog();
  
  catt.sound();
  dogg.sound();
  
  
  
}

class animal{
  
  void sound(){
    print("Animals make sound");
    
  }
}

class cat extends animal{
  @override
  void sound(){
    print("cat make sound");
  }
}
class dog extends animal{
  @override
  void sound(){
    print("dog make sound");
  }
}
14. Lists
void main(){
  List <double> number = [22,3,3,45];
  print(number[3]);

}

15. Map
void main(){
  Map<String,int> marks = {
  'Ahsan' : 1,
  'danish': 10,
  'Steve' : 9
  
};

  if(marks['Ahsan']== null )
{
  print('Marks does not exists');
}
  else{
  print(marks['Ahsan']!.isEven);
}
}



 


 
 