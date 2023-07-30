import Animals.Animal;

import java.util.List;

public class Presenter {
    View view;
    Model model;

    public Presenter(Model m, View v) {
        model = m;
        view = v;
    }

    public void buttonClick() {
        try (Count count = new Count()) {


            while (true) {
                System.out.println(" 1 - Create animal  2 - Show what animal can do 3 - Teach animal new command 4 - Exit");

                int opt1 = view.getValue("Сделать выбор: ");

                if (opt1 == 1) {
                    System.out.println(" 1 - Cat  2 - Dog 3 - Hamster 4 - Horse 5 - Camel 6 - Donkey 7 - Previous menu");
                    int opt2 = view.getValue("Сделать выбор: ");
                    if (opt2 != 7) {
                        System.out.println("Для добавления животного нужно указать через запятую:\n" +
                                "семейство,имя,дата рождения,тип,вид.");
                        System.out.println("Например: кот,Васька,2023-12-01,домашнее,не вьючное.");
                        String[] data = view.getStringValue("Введите необходимые данные: ");
                        if (data.length == 5) {
                            Animal animal = model.createAnimal(String.valueOf(opt2), data);
                            Count.increaseCount();
                            animal.addToAnimals(animal);
                        } else {
                            throw new RuntimeException("Недостаточно данных");
                        }

                    }
                    continue;
                }

                if (opt1 == 2) {
                    System.out.println("Для просмотра команд у животного нужно указать через запятую: семейство, имя");
                    String[] data = view.getStringValue("Введите необходимые данные: ");
                    List<String> commands = model.showCommands(data[0], data[1]);
                    view.showResult(commands);
                    continue;

                }
                if (opt1 == 3) {
                    System.out.println("Для добавления команды животному нужно указать через запятую: семейство, имя, команда");
                    String[] data = view.getStringValue("Введите необходимые данные: ");
                    boolean result = model.addCommand(data[0], data[1], data[2]);
                    view.showResult(result);
                    continue;
                }
                break;
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
