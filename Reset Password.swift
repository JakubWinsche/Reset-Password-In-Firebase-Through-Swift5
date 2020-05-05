    // button.addTarget(self, action:#selector(GetNewPasswordBtn), for: .touchUpInside)
    
    //Allowing user to get new Password
    @objc func GetNewPasswordBtn(_ sender:UIButton)
    {
        Auth.auth().sendPasswordReset(withEmail: UserEmailTF.text!) { error in
            DispatchQueue.main.async {
                if self.UserEmailTF.text?.isEmpty==true || error != nil {
                    let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
                    resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(resetFailedAlert, animated: true, completion: nil)
                }
                if error == nil && self.UserEmailTF.text?.isEmpty==false{
                    let resetEmailAlertSent = UIAlertController(title: "Reset Email Sent", message: "Reset email has been sent to your login email, please follow the instructions in the mail to reset your password", preferredStyle: .alert)
                    resetEmailAlertSent.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(resetEmailAlertSent, animated: true, completion: nil)
                }
            }
        }

    }
