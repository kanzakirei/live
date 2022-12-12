function checkSubmit() {
  const name = document.getElementById("characterNameForm");
  const inquiry = document.getElementById("inquiryForm");
  if (name && name.value && inquiry && inquiry.value) {
    document.myForm.submit();
    document.getElementById('formWrapper').style.display = 'none';
    document.getElementById('thxMessage').style.display = 'block';
  }
}
