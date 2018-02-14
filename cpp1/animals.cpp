#include<iostream>
#include<string>

using namespace std;

class Animal {
  protected:
    string n;
  public:
    Animal(string s="Animal") {n=s;}  // Default value = "Animal"

    // Pure virtual method - must be overridden by any non-abstract
    // derrived class
    virtual void speak() = 0;

    // Virtual method - can be overridden by the child class.  The
    //   type of the object being pointed to determines the method
    //   that gets called.
    virtual void move() { cout << "I'm moving!" << endl; }

    // Non-virtual method - can be overridden by the child class.  
    // The type of the pointer determines the method that gets
    // called.
    void name() { cout << "Hi, I'm " << n << "!" << endl; }
};

class Dog : public Animal {
  public:
    Dog(string s="") : Animal(s) {}

    void speak() { cout << "Woof!" << endl; }
    void move() { cout << "Run around!" << endl; }
    void fetch() { cout << "Fetching!" << endl; }
};

class Cat : public Animal {
  public:
    Cat(string s="") : Animal(s) {}

    void speak() { cout << "Meow!" << endl; }
    void name() { cout << "Meow! " << n << " Meow!" << endl; }
};

int main () {
  // Animal a;    // Can't instantiate an abstract type
  // Animal *aptr;
  Dog d("Fido");
  Dog *dptr;
  Cat c("Bob");
  Cat *cptr;
  Animal * danimal, * canimal;

  // References
  Animal & animalRef = d;
  Dog & dogRef = d;
  Cat & catRef = c;

  /* Animal is an abstract class - can't instantiate
  cout << endl << "Animal object:" << endl;
  a.speak();
  a.move();
  a.name();
  */

  /* Animal is an abstract class - can't instantiate
  aptr = new Animal("Anotherone");
  cout << endl << "Animal pointer to an Animal object:" << endl;
  aptr->speak();
  aptr->move();
  aptr->name();
  */

  cout << endl << "Dog object:" << endl;
  d.speak();
  d.move();
  d.name();
  d.fetch();

  cout << endl << "Dog pointer to an Dog object:" << endl;
  dptr = &d;
  dptr->speak();
  dptr->move();
  dptr->name();
  dptr->fetch();

  cout << endl << "Animal pointer to an Dog object:" << endl;
  danimal = &d;
  danimal->speak();
  danimal->move();
  danimal->name();

  cout << endl << "Dog reference to an Dog object:" << endl;
  dogRef = d;
  dogRef.speak();
  dogRef.move();
  dogRef.name();

  cout << endl << "Animal reference to an Dog object:" << endl;
  animalRef = d;
  animalRef.speak();
  animalRef.move();
  animalRef.name();

  cout << endl << "Cat object:" << endl;
  c.speak();
  c.move();
  c.name();

  cout << endl << "Cat pointer to an Cat object:" << endl;
  cptr = &c;
  cptr->speak();
  cptr->move();
  cptr->name();

  cout << endl << "Animal pointer to an Cat object:" << endl;
  canimal = &c;
  canimal->speak();
  canimal->move();
  canimal->name();

  cout << endl << "Cat reference to an Cat object:" << endl;
  catRef = c;
  catRef.speak();
  catRef.move();
  catRef.name();

  cout << endl << "Animal reference to an Cat object:" << endl;
  animalRef = c;
  animalRef.speak();
  animalRef.move();
  animalRef.name();

  return 0;
}
