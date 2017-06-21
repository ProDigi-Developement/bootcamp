class Animal {
    
    get baseFood() {
        throw new TypeError('Abstract class cannot be instantiated directly.');  
    }
    get maxAge() {
        throw new TypeError('Abstract class cannot be instantiated directly.');  
    }
    getSound() {
        throw new TypeError('Abstract class cannot be instantiated directly.');  
    }
}

class Dog extends Animal {
    constructor(owner) {
        super();
        this.owner = owner;
    }
    get baseFood() {
        return "milk"
    }
    get maxAge() {
        return 10
    }
    getSound() {
        return "Woof"
    }
    toStr() {
        return `Sound: ${this.getSound()}\nFood: ${this.baseFood}\nMax Age: ${this.maxAge} \nOwner: ${this.owner}\n---\n`
    }
}

class Lion extends Animal {
    constructor(owner) {
        super();
        this.owner = owner;
    }
    get baseFood() {
        return "meat"
    }
    get maxAge() {
        return 25
    }
    getSound() {
        return "Roar"
    }
    toStr() {
        return `Sound: ${this.getSound()}\nFood: ${this.baseFood}\nMax Age: ${this.maxAge} \nOwner: ${this.owner}\n---\n`
    }
}

class Sheep extends Animal {
    get baseFood() {
        return "plants"
    }
    get maxAge() {
        return 15
    }
    getSound() {
        return "Baaa"
    }
    toStr() {
        return `Sound: ${this.getSound()}\nFood: ${this.baseFood}\nMax Age: ${this.maxAge} \n---\n`
    }
}

class Example {
    constructor() {
        console.log("OOP Web examples.");
        let lassie = new Dog("John Doe");
        console.log(`Dog Lassie \n${lassie.toStr()}`)
        let scar = new Lion("Jane Doe");
        console.log(`Lion Scar \n${scar.toStr()}`)
        let dolly = new Sheep();
        console.log(`Sheep Dolly \n${dolly.toStr()}`)
    }
}

export default Example