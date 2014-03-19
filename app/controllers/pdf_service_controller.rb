class PdfServiceController < ApplicationController
  def convert
    @error = false
    unless params[:work].nil?
      # => validate title
      unless params[:work][:title].nil?
        work[:title] = params[:work][:title]
      else
        render_error(422)
      end
      
      # => Validate author
      unless params[:work][:author].nil?
        work[:author] = params[:work][:author]
      else
        render_error(422)
      end
      
      #validate body
      unless params[:work][:body].nil?
        work[:body] = params[:work][:body]
      else
        render_error(422)
      end
      
      #validate callback url
      unless params[:work][:callback].nil?
        work[:callback] = params[:work][:callback]
      else
        render_error(422)
      end
      
      unless @error
        # => return ok status
        # => begin pdf generation
        # => post pdf to call-back url
      else
        render_error(500)
      end
    else
      render_error(422)
    end
  end
  
  private
    def render_error(status=500)
      @error = true
      render(:file => File.join(Rails.root, 'public/'.join(status.to_s,'.html')), :status => status, :layout => false)
    end
end
