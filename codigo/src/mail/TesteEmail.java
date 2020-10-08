package mail;


public class TesteEmail {

		public void testarEmail(String[] args) {
			SendMail sendMail = new SendMail("smtp.zoho.com", "465", "lucas.passos@edi-labs.com", "", "ssl");
			
			try {
				sendMail.send(args[0], args[1], args[2], args[3]);
			}
			catch(Exception e) {
				System.out.print(e);
				e.printStackTrace();
			}
		}
}
