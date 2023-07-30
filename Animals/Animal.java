package Animals;

import java.util.ArrayList;
import java.util.List;

public abstract class Animal {
    private String name;
    private List<String> commands = new ArrayList<>();
    private String birthDate;
    private String type;
    private String kind;
    private String family;

    public static List<Animal> animals = new ArrayList<>();


    protected Animal(String family, String name, String birthDate, String type, String kind) {
        this.setFamily(family);
        this.setName(name);
        this.setBirthDate(birthDate);
        this.setType(type);
        this.setKind(kind);
    }

    public static List<Animal> getAnimals() {
        return animals;
    }

    public void addToAnimals(Animal animal) {
        animals.add(animal);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getCommands() {
        return commands;
    }

    public void setCommands(String command) {
        this.commands.add(command);
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getFamily() {
        return family;
    }

    public void setFamily(String family) {
        this.family = family;
    }

    public String toString() {
        return this.getFamily() + " " + this.getName() + " " + this.getBirthDate() + " " + this.getType() + " " + this.getKind();
    }
}
