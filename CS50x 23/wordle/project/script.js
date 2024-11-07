const lengthSlider = document.querySelector(".pass-length input"),
options = document.querySelectorAll(".setting input"),
copyIcon = document.querySelector(".input-box span"),
passwordInput = document.querySelector(".input-box input"),
passIndicator = document.querySelector(".pass-indicator"),
generateBtn = document.querySelector(".doneButton");

const characters = {
    lowercase: "abcdefghijklmnopqrstuvwxyz",
    uppercase: "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
    numbers: "0123456789",
    symbols: "^!$%&|[](){}:;.,*+-#@<>~"
}

const generatePassword = () => {
    let staticPassword = "",
    randomPassword = "",
    excludeDuplicate = false,
    passLength = lengthSlider.value;
    options.forEach(setting => {
        if(setting.checked) {
            if(setting.id !== "random2" && setting.id !== "spaces") {
                staticPassword += characters[setting.id]
            } else if(setting.id === "spaces") {
                staticPassword += `  ${staticPassword}  `
            } else {
                excludeDuplicate = true
            }
        }
    });
    for (let i = 0; i < passLength; i++) {
        let randomChar = staticPassword[Math.floor(Math.random() * staticPassword.length)]
        if(excludeDuplicate) {
            !randomPassword.includes(randomChar) || randomChar == " " ? randomPassword += randomChar : i--
        } else {
            randomPassword += randomChar
        }
    }
    passwordInput.value = randomPassword
}

const upadatePassIndicator = () => {
    passIndicator.id = lengthSlider.value <= 8 ? "weak" : lengthSlider.value <= 16 ? "medium" : "strong"
}

const updateSlider = () => {
    document.querySelector(".pass-length span").innerText = lengthSlider.value
    generatePassword()
    upadatePassIndicator()
}

updateSlider();

const copyPassword = () => {
    navigator.clipboard.writeText(passwordInput.value)
    copyIcon.innerText = "check"
    copyIcon.style.color = "#4285F4"
    setTimeout(() => {
        copyIcon.innerText = "copy_all"
        copyIcon.style.color = "#707070"
    }, 1500)
}

copyIcon.addEventListener("click", copyPassword)
lengthSlider.addEventListener("input", updateSlider)
generateBtn.addEventListener("click", generatePassword)