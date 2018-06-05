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
        return "milk";
    }

    get maxAge() {
        return 10;
    }
    
    getSound() {
        return "Woof";
    }

    toStr() {
        return `Sound: ${this.getSound()}\nFood: ${this.baseFood}\nMax Age: ${this.maxAge} \nOwner: ${this.owner}\n--End--\n`;
    }
}

class Lion extends Animal {
    constructor(owner) {
        super();
        this.owner = owner;
    }

    get baseFood() {
        return "meat";
    }

    get maxAge() {
        return 25;
    }

    getSound() {
        return "Roar";
    }

    toStr() {
        return `Sound: ${this.getSound()}\nFood: ${this.baseFood}\nMax Age: ${this.maxAge} \nOwner: ${this.owner}\n--End--\n`;
    }
}

class Sheep extends Animal {
    get baseFood() {
        return "plants";
    }
    
    get maxAge() {
        return 15;
    }

    getSound() {
        return "Baaa";
    }

    toStr() {
        return `Sound: ${this.getSound()}\nFood: ${this.baseFood}\nMax Age: ${this.maxAge} \nOwner: ${this.owner}\n--End--\n`;
    }
}
