import Animals.*;

import java.util.ArrayList;
import java.util.List;

public class Model {

    Animal createAnimal(String choice, String[] data) {
        switch (choice) {
            case "1":
                Animal cat = new Cat(data[0], data[1], data[2], data[3], data[4]);
                return cat;

            case "2":
                Animal dog = new Dog(data[0], data[1], data[2], data[3], data[4]);
                return dog;

            case "3":
                Animal hamster = new Hamster(data[0], data[1], data[2], data[3], data[4]);
                return hamster;

            case "4":
                Animal horse = new Horse(data[0], data[1], data[2], data[3], data[4]);
                return horse;

            case "5":
                Animal camel = new Camel(data[0], data[1], data[2], data[3], data[4]);
                return camel;

            case "6":
                Animal donkey = new Donkey(data[0], data[1], data[2], data[3], data[4]);
                return donkey;

            default:
                throw new RuntimeException("Такая опция не предусмотрена");
        }
    }

    public boolean addCommand(String family, String name, String command) {
        for (Animal creature : Animal.getAnimals()
        ) {
            if (creature.getFamily().equalsIgnoreCase(family) && creature.getName().equalsIgnoreCase(name)) {
                creature.setCommands(command);
                return true;
            }
        }
        return false;
    }

    public List<String> showCommands(String family, String name) {
        List<String> canDoCommands = new ArrayList<>();
        for (Animal creature : Animal.getAnimals()
        ) {
            if (creature != null) {
                if (creature.getFamily().equalsIgnoreCase(family) && creature.getName().equalsIgnoreCase(name)) {
                    canDoCommands = creature.getCommands();
                }

            } else {
                return null;
            }
        }
        return canDoCommands;
    }


}
