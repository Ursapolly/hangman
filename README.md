# hangman
Виселица — игра из нашего детства, в которую раньше игрались на бумажке.

## Установка и запуск игры

*Требования: Ruby версии 2.4.2 и выше*

Скачайте репозиторий hangman

Перейдите в териминале (cmd) в папку с игрой

Запустите с помощью интерпретатора ruby файл main.rb

```
ruby main.rb
```

## Игровой процесс

Программа сама предложит слово из списка

Всё, что вам нужно делать, — вводить по одной русские буквы и смотреть результат —  угадали или нет

У вас есть всего (или целых) семь попыток

---

**Примечание №1**: если файл со словами исчезнет, то слово можно ввести в качестве аргумента при запуске игры:

```
ruby main.rb слово
```

**Примечание №2**: а если вдруг вы отгадаете все слова из списка, то его можно отредактировать. Просто зайдите в папку \hangman\data
и добавьте в файл words.txt свой список слов. Внимание: не допускайте пустых строчек между словами и в конце списка

Удачной игры! :)