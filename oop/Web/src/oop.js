class Animal {
    constructor(animalType) {
        self.animalType = animalType;
    }
    getSound() {
        let sound = "";
        switch (self.animalType) {
            case "dog":
                sound = "Woof";
                break;
            case "cat":
                sound = "Meow";
            case "lion":
                sound = "Roar";
            case "sheep":
                sound = "Baaa";
            default:
                break;
        }
        return sound;
    }
}

class Example {
    constructor() {
        console.log("OOP Web examples.");
        let lassie = new Animal("dog");
        console.log(`Dog Lassie Sound: ${lassie.getSound()}`)
        let scar = new Animal("lion");
        console.log(`Lion scar Sound: ${scar.getSound()}`)
        let dolly = new Animal("sheep");
        console.log(`Sheep dolly Sound: ${dolly.getSound()}`)
    }
}

export default Example