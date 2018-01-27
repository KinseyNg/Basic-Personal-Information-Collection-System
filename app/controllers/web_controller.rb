class WebController < ApplicationController
  def lucky
    @refid=params[:refid]

  end

  def admin
    @start=params[:start]
    @end=params[:end]
    @result=Users.find_by_id(@start..@end)

   # result=Users
  end

  def finish
    @name= params[:name]
    @tel=params[:tel]
    @email = params[:email]
    @form= params[:form]
   @refid=params[:refid]
    if(!@name.present?||!@tel.present?||!@form.present?)
      flash[:error]="請輸入所有必要欄位再提交"
      puts "data emtry"
      redirect_to :back
    elsif(!((@tel.split(//).first=='2')||(@tel.split(//).first=='8')||(@tel.split(//).first=='6')||(@tel.split(//).first=='9')||(@tel.split(//).first=='5')||(@tel.split(//).first=='3')))
      flash[:error]="請輸入有效香港電話號碼"
      puts "phone start"
      redirect_to :back

    elsif(!(@tel.length==8))
      puts @tel.length
      flash[:error]="請輸入有效香港電話號碼"
      redirect_to :back
    else
      findrefuser=Users.find_by_refcode(@refid)
      if(findrefuser.present?)
        findrefuser.increment(:refcounter, by = 1)
        findrefuser.save

      end
      if session[:ok].nil?
        ip = request.remote_ip
        @random= (0...8).map { (65 + rand(26)).chr }.join


        record = Users.create(:tel=>@tel,:refcode=>@random,:email=>@email,:name=>@name,:ip=>ip,:form=>@form)
        session[:ok]=@random
      else
        @random  =    session[:ok]
      end

    end

  end
end
