class Animal {
    getSound() {
        throw new TypeError('Abstract class cannot be instantiated directly.');  
    }
}

class Dog extends Animal {
    getSound() {
        return "Woof"
    }
}

class Lion extends Animal {
    getSound() {
        return "Roar"
    }
}

class Sheep extends Animal {
    getSound() {
        return "Baaa"
    }
}

class Example {
    constructor() {
        console.log("OOP Web examples.");
        let lassie = new Dog();
        console.log(`Dog Lassie Sound: ${lassie.getSound()}`)
        let scar = new Lion();
        console.log(`Dog Lassie Sound: ${scar.getSound()}`)
        let dolly = new Sheep();
        console.log(`Dog Lassie Sound: ${dolly.getSound()}`)
    }
}

export default Example