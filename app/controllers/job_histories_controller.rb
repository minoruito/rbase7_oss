class JobHistoriesController < UserApplicationController
  include ::Rbase::PluginModule::Extendable # 継承を許可する宣言（必須）
  respond_to :html

  def index
    @model_name = "job_histories/sort_conditions"
    @sort_url = job_histories_path

    if params[:clear] == "true"
      session[:job_histories_search_conditions] = nil
      session[@model_name] = nil
    end

    @stimulus_params = {
    }.to_json

    if params[:sort_field_name]
      @sort_field_name = params[:sort_field_name].nil? ? nil : params[:sort_field_name].to_sym
      sort_condition = set_sort_field
    end

    #ソートを行うので、検索条件は非表示で対応
    if params[:job_histories_search_conditions]
      @condition = ::JobHistories::SearchConditions.new(search_condition_params)
      @condition.current_admin_user = current_admin_user
      return render 'index' unless @condition.valid?

      unless sort_condition
        session[@model_name] = nil
      end
      @condition.sort_condition = sort_condition
      @condition.page = params[:page] if params[:page].present?

      session[:job_histories_search_conditions] = @condition
      @job_histories = @condition.search.page(@condition.page)
    else
      if session[:job_histories_search_conditions]
        @condition = session[:job_histories_search_conditions]
        @condition.current_admin_user = current_admin_user
        @condition.page = params[:page] if params[:page].present?
        @condition.sort_condition = sort_condition if sort_condition
        @job_histories = @condition.search.page(@condition.page)
      else
        @condition = ::JobHistories::SearchConditions.new
        @condition.current_admin_user = current_admin_user
        @condition.sort_condition = sort_condition if sort_condition
        @condition.page = params[:page] if params[:page].present?
        session[:job_histories_search_conditions] = @condition
        @job_histories = @condition.search.page(@condition.page)
      end
    end

    #ソート場合、turbo_frame_tagの更新を行う
    if @sort_field_name
      render turbo_stream: [
        turbo_stream.replace("entry-turbo-job_history_search_results", partial: 'job_histories/search_results'),
      ]
    elsif params[:reload] == "true"
      render turbo_stream: [
        turbo_stream.replace("entry-turbo-message", partial: 'common/message'),
        turbo_stream.replace("entry-turbo-job_history_search_results", partial: 'job_histories/search_results'),
      ]
    else
      render :index
    end
  end
end
