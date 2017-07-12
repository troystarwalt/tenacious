const flashDismiss = () => {
  const removeAlert = (e) => {
    document.body.removeChild(e.target.parentNode);
  };
  const dismissAlerts = document.getElementsByClassName('dismiss');

  for (var dismiss of dismissAlerts) {
    dismiss.onclick = removeAlert;
  }
};

export default flashDismiss;
