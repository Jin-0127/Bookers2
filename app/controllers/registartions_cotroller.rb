class RegistrationsController < Devise::RegistrationsController
  def create
    super
    flash[:notice] = "新規登録が完了しました。"
  end

  def update
    super
    flash[:notice] = "アカウント情報が更新されました。"
  end

  def destroy
    super
    flash[:notice] = "アカウントが削除されました。"
  end
end