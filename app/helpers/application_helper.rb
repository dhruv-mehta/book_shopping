module ApplicationHelper

def number_to_currency_br(number,unit)
  
end


def hidden_div_if(condition, attributes = {}, &block)
	if condition
			attributes["style"] = "display: none"
	end	
			content_tag("div", attributes, &block) 			
	end
end

