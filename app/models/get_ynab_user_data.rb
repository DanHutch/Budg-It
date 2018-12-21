class GetYnabUserData

  def initialize(token)
    @token = token
	end
	
	def self.get_it(user)
		token = user.tokens.last.token		
    new(token).get_it(user)
	end
	
  def get_it(user)
    yuid = YnabService.new(@token).get_uid
    user.tokens.last.update(uid: yuid)
    user.tokens.last.save
  end

  def self.check_it(token)
    new(token).check_it(token)
  end

  def check_it(token)
    YnabService.new(@token).get_uid
  end
  
	
end