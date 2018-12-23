class TexterWelcomeController < ApplicationController
  def create
    AgentTexter.alert(params).deliver
     redirect_to root_url,
       success: 'Thanks! An agent will be contacting you shortly.'
   rescue Twilio::REST::RequestError => error
     redirect_to root_url,
       error: 'Oops! There was an error. Please try again.'
   end
end
