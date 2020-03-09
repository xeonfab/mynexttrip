export const initWizard = () => {
  const wizardEl = document.querySelector('.js-wizard');
    if (!wizardEl) {
      return;
    }

  const nextBtnEl = wizardEl.querySelector('.js-wizard-next');
  const previousBtnEl = wizardEl.querySelector('.js-wizard-previous')
  const wizardStepsEl = wizardEl.querySelector('.js-wizard-steps');

  let stepNumber = 0;

  const updateDisplay = () => {
    wizardStepsEl.classList.remove('is--step-0');
    wizardStepsEl.classList.remove('is--step-1');
    wizardStepsEl.classList.remove('is--step-2');
    wizardStepsEl.classList.remove('is--step-3');
    wizardStepsEl.classList.remove('is--step-4');

    wizardStepsEl.classList.add(`is--step-${stepNumber}`);
  }

  nextBtnEl.addEventListener('click', () => {
    stepNumber += 1;
    updateDisplay();
  });
  previousBtnEl.addEventListener('click', () => {
    stepNumber -= 1;
    updateDisplay();
  });

}
