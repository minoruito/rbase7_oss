class JobManage < ApplicationRecord
  include ::Rbase::PluginModule::Extendable # 継承を許可する宣言（必須）
  include ::SelectableAttr::Base

  stampable

  belongs_to :request_by_user, class_name: "AdminUser", foreign_key: "request_by", optional: true

  selectable_attr :job_type do
    update_with_plugins(:JobManage, :added_entries_for_job_type)
  end

  def self.added_entries_for_job_type(mod); end

  selectable_attr :status do
    entry 'registered', :registered, '登録済'
    entry 'wait', :wait, '処理待ち'
    entry 'processing', :processing, '処理中'
    entry 'done', :done, '処理完了'
  end

  def self.get_job_manage(job_type, job_manage_id)
    JobManage.where(id: job_manage_id, job_type: job_type).first
  end

  def self.register_job(job_type, current_admin_user)
    job_manage = JobManage.new
    job_manage.status = "registered"
    job_manage.job_type = job_type
    job_manage.request_by = current_admin_user.id
    job_manage.save!
    job_manage
  end

  def start_wait_job(job)
    self.update!(active_job_id: job.job_id, status: "wait", requested_at: Time.now)
  end

  def start_job
    self.update!(status: "processing", started_at: Time.now)
  end

  def finished_job
    self.update!(status: "done", finished_at: Time.now,  spent: Time.now - self.started_at)
  end
end
