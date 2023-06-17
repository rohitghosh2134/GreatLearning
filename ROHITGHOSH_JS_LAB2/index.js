var questions = [
    {
        question: "Question 1: What is the capital of France?",
        choices: ["Paris", "Madrid", "Rome", "Berlin"],
        correctAnswer: 0
    },
    {
        question: "Question 2: What is the largest planet in our solar system?",
        choices: ["Mars", "Jupiter", "Venus", "Saturn"],
        correctAnswer: 1
    },
    {
        question: "Question 3: Who painted the Mona Lisa?",
        choices: ["Leonardo da Vinci", "Pablo Picasso", "Vincent van Gogh", "Michelangelo"],
        correctAnswer: 0
    },
    // Add more questions here...
    {
        question: "Question 4: What is the chemical symbol for gold?",
        choices: ["Au", "Ag", "Fe", "Cu"],
        correctAnswer: 0
    },
    {
        question: "Question 5: Which country is known as the Land of the Rising Sun?",
        choices: ["China", "Japan", "India", "Australia"],
        correctAnswer: 1
    },
    {
        question: "Question 6: What is the square root of 64?",
        choices: ["4", "8", "16", "64"],
        correctAnswer: 1
    },
    {
        question: "Question 7: Who wrote the play 'Romeo and Juliet'?",
        choices: ["William Shakespeare", "Jane Austen", "Mark Twain", "Charles Dickens"],
        correctAnswer: 0
    },
    {
        question: "Question 8: Which planet is known as the Red Planet?",
        choices: ["Mars", "Jupiter", "Venus", "Saturn"],
        correctAnswer: 0
    },
    {
        question: "Question 9: What is the largest mammal on Earth?",
        choices: ["Elephant", "Blue whale", "Giraffe", "Lion"],
        correctAnswer: 1
    },
    {
        question: "Question 10: Who invented the telephone?",
        choices: ["Thomas Edison", "Alexander Graham Bell", "Nikola Tesla", "Albert Einstein"],
        correctAnswer: 1
    }
];

var currentQuestion = 0;
var score = 0;

var quizContainer = document.getElementById("quiz");
var questionElement = document.getElementById("question");
var choiceElements = [
    document.getElementById("choice0"),
    document.getElementById("choice1"),
    document.getElementById("choice2"),
    document.getElementById("choice3")
];
var progressElement = document.getElementById("progress");

function showQuestion() {
    var question = questions[currentQuestion];
    questionElement.textContent = question.question;

    for (var i = 0; i < question.choices.length; i++) {
        choiceElements[i].textContent = question.choices[i];
        choiceElements[i].addEventListener("click", handleChoiceClick);
    }

    progressElement.textContent = "Question " + (currentQuestion + 1) + " of " + questions.length;
}

function handleChoiceClick(event) {
    var selectedChoice = event.target;
    var question = questions[currentQuestion];

    var selectedAnswer = Array.from(choiceElements).indexOf(selectedChoice);
    if (selectedAnswer === question.correctAnswer) {
        score++;
    }

    currentQuestion++;

    if (currentQuestion === questions.length) {
        showResult();
    } else {
        showQuestion();
    }
}

function showResult() {
    quizContainer.innerHTML = "<h1>Quiz Completed!</h1>";
    quizContainer.innerHTML += "<p>Your score is: " + score + "/" + questions.length + "</p>";
    quizContainer.innerHTML += "<p>Percentage: " + ((score / questions.length) * 100) + "%</p>";
}

showQuestion();
