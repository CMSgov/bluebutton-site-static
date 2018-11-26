// Mobile Navigation Logic
// -----------------------

// Get all nav items from desktop menu to append to the mobile nav
const mobileNavContent = document.querySelector('.desktop-nav-items').innerHTML;

// Define the Mobile Nav Container - this is where we will append the mobileNavContent
const mobileNavContainer = document.querySelector('.mobile-nav-items');

// Apend nav items to mobile nav container
mobileNavContainer.innerHTML += mobileNavContent;

// Define the mobile nav trigger button - this opens and closes the mobile nav
const mobileNavTriggerButton = document.querySelector('.mobile-nav-trigger-button');

// Add the click ation to the mobile nav trigger
mobileNavTriggerButton.addEventListener('click', () => {
  mobileNavContainer.classList.toggle('is-visible');
  mobileNavTriggerButton.classList.toggle('trigger-active');
  // Define the mobile nav icon
  let mobileNavIcon = document.querySelector('.mobile-nav-icon');

  // Define the text for the mobile nav trigger button
  let mobileNavTriggerText = document.querySelector('.mobile-nav-trigger-text');

  // Set up toggle for the menu icon and text
  if (mobileNavContainer.classList.contains('is-visible') === true) {
    mobileNavTriggerText.innerHTML = 'Close';
    mobileNavIcon.innerHTML = feather.icons['x'].toSvg();
    // Add an event listenter to close the nav if the window is resized
    window.addEventListener('resize', () => {
      // Close and reset the nav
      mobileNavTriggerText.innerHTML = 'Menu'
      mobileNavIcon.innerHTML = feather.icons['menu'].toSvg();
      mobileNavContainer.classList.remove('is-visible');
      mobileNavTriggerButton.classList.remove('trigger-active');
    });
  } else {
    mobileNavTriggerText.innerHTML = 'Menu'
    mobileNavIcon.innerHTML = feather.icons['menu'].toSvg();
  }
});
