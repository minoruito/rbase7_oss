# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2026_04_27_120000) do
  create_table "admin_settings", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.boolean "use_login_id"
    t.string "locale"
    t.string "time_zone"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_admin_settings_on_deleted_at"
    t.index ["use_login_id"], name: "index_admin_settings_on_use_login_id"
  end

  create_table "admin_user_attachments", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "admin_user_id"
    t.string "filename"
    t.integer "file_size"
    t.string "document"
    t.string "token"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_admin_user_attachments_on_admin_user_id"
    t.index ["deleted_at"], name: "index_admin_user_attachments_on_deleted_at"
  end

  create_table "admin_user_custom_fields", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "admin_user_id"
    t.integer "custom_field_id"
    t.string "field_value"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_admin_user_custom_fields_on_admin_user_id"
    t.index ["custom_field_id"], name: "index_admin_user_custom_fields_on_custom_field_id"
    t.index ["deleted_at"], name: "index_admin_user_custom_fields_on_deleted_at"
  end

  create_table "admin_user_sites", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "admin_user_id"
    t.integer "site_id"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_admin_user_sites_on_admin_user_id"
    t.index ["deleted_at"], name: "index_admin_user_sites_on_deleted_at"
    t.index ["site_id"], name: "index_admin_user_sites_on_site_id"
  end

  create_table "admin_users", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", limit: 100
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "role_id"
    t.string "status_div", default: "before_apply"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "login_from", comment: "ログイン元"
    t.string "sso_session_id", comment: "SSOセッションID"
    t.index ["deleted_at"], name: "index_admin_users_on_deleted_at"
    t.index ["role_id"], name: "index_admin_users_on_role_id"
  end

  create_table "custom_field_sites", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "custom_field_id"
    t.integer "site_id"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["custom_field_id"], name: "index_custom_field_sites_on_custom_field_id"
    t.index ["deleted_at"], name: "index_custom_field_sites_on_deleted_at"
    t.index ["site_id"], name: "index_custom_field_sites_on_site_id"
  end

  create_table "custom_fields", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "custom_field_type"
    t.string "issue_type"
    t.string "field_name"
    t.string "field_type"
    t.string "format_regexp"
    t.boolean "required"
    t.string "default_value"
    t.integer "field_size"
    t.string "comment", limit: 1000
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "display_name", comment: "フィールド表示名"
    t.integer "display_order", comment: "表示順"
    t.index ["deleted_at"], name: "index_custom_fields_on_deleted_at"
  end

  create_table "delayed_jobs", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "dwh_caches", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "idnumber", comment: "ユーザID"
    t.text "result", comment: "結果"
    t.string "query_type", comment: "検索タイプ"
    t.string "url", limit: 1024, comment: "URL"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "max_age"
    t.text "params"
    t.index ["deleted_at"], name: "index_dwh_caches_on_deleted_at"
  end

  create_table "eport_competences", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIコンピテンシーマスタ", force: :cascade do |t|
    t.string "competence_cd", comment: "コンピテンシーCD"
    t.string "competence_name", comment: "コンピテンシー名"
    t.text "expression", comment: "コンピテンシー説明"
    t.integer "display_order", comment: "表示順"
    t.bigint "inst_org_id", comment: "学部組織ID"
    t.bigint "dept_org_id", comment: "学科組織ID"
    t.bigint "course_org_id", comment: "コース組織ID"
    t.string "classification", comment: "クラス"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.bigint "eport_rubric_level_id", comment: "eポート達成度ID"
    t.index ["deleted_at"], name: "index_eport_competences_on_deleted_at"
    t.index ["eport_rubric_level_id"], name: "index_eport_competences_on_eport_rubric_level_id"
  end

  create_table "eport_converted_dps", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIDP変換テーブル", force: :cascade do |t|
    t.string "from_dp", comment: "変換元DP"
    t.string "to_dp", comment: "変換先DP"
    t.bigint "inst_org_id", comment: "学部組織ID"
    t.bigint "dept_org_id", comment: "学科組織ID"
    t.bigint "first_dept_org_id", comment: "入学時学科ID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_converted_dps_on_deleted_at"
  end

  create_table "eport_dashboards", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIダッシュボードデータ", force: :cascade do |t|
    t.bigint "site_id", comment: "サイトID"
    t.string "dashboard_type", comment: "ダッシュボードタイプ"
    t.text "layout_json", comment: "レイアウトJSON"
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_dashboards_on_deleted_at"
  end

  create_table "eport_graph_sites", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIグラフマスタサイト", force: :cascade do |t|
    t.bigint "eport_graph_id", comment: "LTIグラフID"
    t.bigint "site_id", comment: "サイトID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_graph_sites_on_deleted_at"
    t.index ["eport_graph_id"], name: "index_eport_graph_sites_on_eport_graph_id"
    t.index ["site_id"], name: "index_eport_graph_sites_on_site_id"
  end

  create_table "eport_graphs", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIグラフマスタ", force: :cascade do |t|
    t.string "name", comment: "グラフ名称"
    t.text "explanation", comment: "内容"
    t.text "script", comment: "script記述"
    t.string "graph_code", comment: "グラフコード"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_graphs_on_deleted_at"
  end

  create_table "eport_information_lms_users", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "eport_information_id", comment: "LTI通知ID"
    t.bigint "lms_user_id", comment: "LMユーザID"
    t.boolean "read"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_information_lms_users_on_deleted_at"
    t.index ["eport_information_id"], name: "index_eport_information_lms_users_on_eport_information_id"
    t.index ["lms_user_id"], name: "index_eport_information_lms_users_on_lms_user_id"
  end

  create_table "eport_informations", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI通知", force: :cascade do |t|
    t.text "message", comment: "メッセージ"
    t.string "message_div", comment: "メッセージ区分"
    t.datetime "sent_at", comment: "送信日時"
    t.string "url", comment: "対象URL"
    t.string "send_div", comment: "送信区分"
    t.string "title", comment: "タイトル"
    t.string "issue_id", comment: "申請ID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.index ["deleted_at"], name: "index_eport_informations_on_deleted_at"
    t.index ["sent_at"], name: "index_eport_informations_on_sent_at"
  end

  create_table "eport_input_categories", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI入力カテゴリー", force: :cascade do |t|
    t.string "name", comment: "名前"
    t.text "meta", comment: "メタ情報"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "display_order", comment: "表示順"
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.index ["deleted_at"], name: "index_eport_input_categories_on_deleted_at"
  end

  create_table "eport_input_category_lti_orgs", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI入力カテゴリマスタ組織", force: :cascade do |t|
    t.bigint "eport_input_category_id", comment: "LTI入力カテゴリID"
    t.bigint "lti_org_id", comment: "LTI組織ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at", comment: "削除日時"
    t.index ["deleted_at"], name: "index_eport_input_category_lti_orgs_on_deleted_at"
  end

  create_table "eport_reflection_import_attachments", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返りインポート添付", force: :cascade do |t|
    t.bigint "eport_reflection_import_id", comment: "LTI振り返りインポートID"
    t.string "filename", comment: "ファイル名"
    t.integer "file_size", comment: "ファイルサイズ"
    t.string "document", comment: "ドキュメント"
    t.string "token", comment: "トークン"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_reflection_import_attachments_on_deleted_at"
    t.index ["eport_reflection_import_id"], name: "index_lti_relfection_import_atts_import_id"
  end

  create_table "eport_reflection_import_errors", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返りインポートエラー", force: :cascade do |t|
    t.bigint "eport_reflection_import_id", comment: "LTI振り返りインポートID"
    t.integer "line_no", comment: "行番号"
    t.string "error_message", comment: "エラーメッセージ"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_reflection_import_errors_on_deleted_at"
    t.index ["eport_reflection_import_id"], name: "index_eport_reflection_import_errors_on_lti_reflection_import_id"
  end

  create_table "eport_reflection_imports", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返りインポート", force: :cascade do |t|
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.index ["deleted_at"], name: "index_eport_reflection_imports_on_deleted_at"
  end

  create_table "eport_reflection_input_downloads", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返り入力ダウンロード", force: :cascade do |t|
    t.bigint "lms_user_id", comment: "LMSユーザID"
    t.datetime "requested_at", comment: "作成開始日時"
    t.datetime "compressed_at", comment: "作成完了日時"
    t.string "document", comment: "ドキュメント"
    t.string "filename", comment: "ファイル名"
    t.integer "filesize", comment: "ファイルサイズ"
    t.integer "inclusion_line_num", comment: "行数"
    t.boolean "created", comment: "作成状況"
    t.text "params", comment: "パラメータ"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.string "status", comment: "ステータス"
    t.bigint "delayed_jobs_id", comment: "DELAYED_JOB ID"
    t.index ["deleted_at"], name: "index_eport_reflection_input_downloads_on_deleted_at"
  end

  create_table "eport_reflection_instructors", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返り担当教員", force: :cascade do |t|
    t.bigint "eport_reflection_id", comment: "LTI振り返りマスタID"
    t.bigint "student_eport_reflection_participation_id", comment: "LMSユーザID(学生）"
    t.bigint "teacher_eport_reflection_participation_id", comment: "LMSユーザID(教職員）"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.index ["deleted_at"], name: "index_eport_reflection_instructors_on_deleted_at"
  end

  create_table "eport_reflection_items", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返りアイテムマスタ", force: :cascade do |t|
    t.bigint "eport_reflection_question_id", comment: "LTI振り返り設問マスタID"
    t.string "reflect_for_div", comment: "振り返り対象者区分"
    t.text "alternatives", comment: "選択肢"
    t.integer "allow_upload_number", comment: "アップロード可能数"
    t.string "allow_upload_ext", comment: "アップロード許可拡張子"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_reflection_items_on_deleted_at"
    t.index ["eport_reflection_question_id", "reflect_for_div"], name: "index_lti_reflection_items_keys"
    t.index ["eport_reflection_question_id"], name: "index_eport_reflection_items_on_eport_reflection_question_id"
  end

  create_table "eport_reflection_journal_import_attachments", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返りマスタ入力添付", force: :cascade do |t|
    t.bigint "eport_reflection_journal_import_id", comment: "LTI振り返り入力インポートID"
    t.string "filename", comment: "ファイル名"
    t.integer "file_size", comment: "ファイルサイズ"
    t.string "document", comment: "ドキュメント"
    t.string "token", comment: "トークン"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_reflection_journal_import_attachments_on_deleted_at"
    t.index ["eport_reflection_journal_import_id"], name: "index_lti_rel_journal_imp_atts_import_id"
  end

  create_table "eport_reflection_journal_import_errors", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返りマスタ入力インポートエラー", force: :cascade do |t|
    t.bigint "eport_reflection_journal_import_id", comment: "LTI振り返り入力インポートID"
    t.integer "line_no", comment: "行番号"
    t.string "error_message", comment: "エラーメッセージ"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_reflection_journal_import_errors_on_deleted_at"
    t.index ["eport_reflection_journal_import_id"], name: "index_lti_rel_journal_err_atts_import_id"
  end

  create_table "eport_reflection_journal_imports", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "EPORT振り返りマスタ入力インポート", force: :cascade do |t|
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_reflection_journal_imports_on_deleted_at"
  end

  create_table "eport_reflection_journal_participants", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返りマスタ入力参加者", force: :cascade do |t|
    t.bigint "eport_reflection_journal_id", comment: "LTI振り返りマスタ入力ID"
    t.bigint "eport_reflection_participant_id", comment: "LTI振り返り参加者ID"
    t.datetime "sent_at", comment: "通知日時"
    t.string "send_div", comment: "通知区分"
    t.datetime "answered_at", comment: "回答日時"
    t.datetime "answer_sent_at", comment: "回答通知日時"
    t.bigint "issue_id", comment: "申請ID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_reflection_journal_participants_on_deleted_at"
    t.index ["eport_reflection_journal_id"], name: "idx_lti_reflection_journal_participants_rjid"
    t.index ["sent_at"], name: "index_eport_reflection_journal_participants_on_sent_at"
  end

  create_table "eport_reflection_journals", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返りマスタ入力", force: :cascade do |t|
    t.bigint "eport_reflection_id", comment: "LTI振り返りマスタID"
    t.bigint "lms_user_id", comment: "LMSユーザID"
    t.integer "field_num", comment: "設問数"
    t.integer "required_field_num", comment: "必須設問数"
    t.integer "input_num", comment: "設問回答数"
    t.integer "required_input_num", comment: "必須設問回答数"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "submit_from_id", comment: "元振り返りマスタ入力ID"
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.index ["deleted_at"], name: "index_eport_reflection_journals_on_deleted_at"
    t.index ["lms_user_id"], name: "idx_lti_reflection_journals_luid"
    t.index ["submit_from_id"], name: "idx_lti_reflection_journals_sfid"
  end

  create_table "eport_reflection_part_import_attachments", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返り参加者インポート添付", force: :cascade do |t|
    t.bigint "eport_reflection_part_import_id", comment: "LTI振り返り参加者インポートID"
    t.string "filename", comment: "ファイル名"
    t.integer "file_size", comment: "ファイルサイズ"
    t.string "document", comment: "ドキュメント"
    t.string "token", comment: "トークン"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_reflection_part_import_attachments_on_deleted_at"
    t.index ["eport_reflection_part_import_id"], name: "index_lti_relfection_part_import_atts_import_id"
  end

  create_table "eport_reflection_part_import_datas", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返り参加者インポートデータ", force: :cascade do |t|
    t.string "edit_div", comment: "編集区分"
    t.string "reflection_cd", comment: "振り返りフォームCD"
    t.string "user_id", comment: "ユーザID"
    t.string "role_div", comment: "権限区分"
    t.integer "line_no", comment: "行番号"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eport_reflection_part_import_errors", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返り参加者インポートエラー", force: :cascade do |t|
    t.bigint "eport_reflection_part_import_id", comment: "LTI振り返り参加者インポートID"
    t.integer "line_no", comment: "行番号"
    t.string "error_message", comment: "エラーメッセージ"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_reflection_part_import_errors_on_deleted_at"
    t.index ["eport_reflection_part_import_id"], name: "index_lti_relfection_part_import_err_atts_import_id"
  end

  create_table "eport_reflection_part_student_import_datas", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返り参加者担当学生インポートデータ", force: :cascade do |t|
    t.bigint "eport_reflection_student_import_data_id", comment: "LTI振り返り参加者インポートデータID"
    t.string "user_id", comment: "担当学生"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eport_reflection_participant_imports", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返り参加者インポート", force: :cascade do |t|
    t.bigint "site_id", comment: "サイトID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.index ["deleted_at"], name: "index_eport_reflection_participant_imports_on_deleted_at"
  end

  create_table "eport_reflection_participants", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返り参加者", force: :cascade do |t|
    t.bigint "eport_reflection_id", comment: "LTI振り返りマスタID"
    t.bigint "lms_user_id", comment: "LMSユーザID"
    t.string "role_div", comment: "権限区分"
    t.datetime "assigned_at", comment: "配布日時"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.index ["deleted_at"], name: "index_eport_reflection_participants_on_deleted_at"
    t.index ["eport_reflection_id"], name: "index_eport_reflection_participants_on_eport_reflection_id"
    t.index ["lms_user_id"], name: "index_eport_reflection_participants_on_lms_user_id"
    t.index ["role_div"], name: "index_eport_reflection_participants_on_role_div"
  end

  create_table "eport_reflection_question_journal_attachments", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返り設問マスタ入力添付", force: :cascade do |t|
    t.bigint "eport_reflection_question_journal_id", comment: "LTI振り返り設問入力ID"
    t.string "filename", comment: "ファイル名"
    t.integer "file_size", comment: "ファイルサイズ"
    t.string "document", comment: "ドキュメント"
    t.string "token", comment: "トークン"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_lti_reflection_question_journal_attachments_on_deleted_at"
  end

  create_table "eport_reflection_question_journal_rubrics", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "eport_reflection_question_journal_id", comment: "振り返り設問回答ID"
    t.bigint "competence_id", comment: "コンピテンシーID"
    t.string "competence_name", comment: "コンピテンシー名"
    t.string "answer", comment: "回答"
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competence_id"], name: "index_eport_reflection_question_journal_rubrics_on_competence_id"
  end

  create_table "eport_reflection_question_journals", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返り設問マスタ入力", force: :cascade do |t|
    t.bigint "eport_reflection_journal_id", comment: "LTI振り返りマスタ入力ID"
    t.bigint "eport_reflection_question_id", comment: "振り返り設問マスタID"
    t.text "answer", comment: "回答"
    t.datetime "answered_at", comment: "回答日時"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.index ["deleted_at"], name: "index_eport_reflection_question_journals_on_deleted_at"
    t.index ["eport_reflection_journal_id"], name: "idx_lti_reflection_question_journals_jid"
    t.index ["eport_reflection_question_id"], name: "index_lti_ref_q_journals_on_lti_ref_q_id"
  end

  create_table "eport_reflection_questions", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返り設問マスタ", force: :cascade do |t|
    t.bigint "eport_reflection_id", comment: "LTI振り返りフォームID"
    t.boolean "self_assessment_flg", comment: "自己評価対象フラグ"
    t.string "self_assessment_cd", comment: "自己評価入力タイプCD"
    t.boolean "multi_assessment_flg", comment: "他者評価対象フラグ"
    t.string "multi_assessment_cd", comment: "他者評価入力タイプCD"
    t.integer "display_order", comment: "表示順"
    t.boolean "required", comment: "必須"
    t.boolean "display_title_flg", comment: "設問タイトル表示フラグ"
    t.string "title", comment: "設問タイトル"
    t.boolean "display_explanation_flg", comment: "設問説明文表示フラグ"
    t.text "explanation", comment: "設問説明文"
    t.bigint "competence_id", comment: "コンピテンシーID"
    t.boolean "allow_display_multi_assessment", comment: "他者評価表示許可"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.index ["deleted_at"], name: "index_eport_reflection_questions_on_deleted_at"
    t.index ["eport_reflection_id"], name: "index_eport_reflection_questions_on_eport_reflection_id"
    t.index ["multi_assessment_cd"], name: "index_eport_reflection_questions_on_multi_assessment_cd"
    t.index ["self_assessment_cd"], name: "index_eport_reflection_questions_on_self_assessment_cd"
  end

  create_table "eport_reflections", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI振り返りマスタ", force: :cascade do |t|
    t.bigint "lti_org_id", comment: "LTI組織ID"
    t.string "reflection_cd", comment: "振り返りフォームCD"
    t.bigint "eport_input_category_id", comment: "LTI入力カテゴリID"
    t.string "title", comment: "タイトル"
    t.datetime "start_from", comment: "開始日"
    t.datetime "end_to", comment: "終了日"
    t.boolean "allow_when_overtime", comment: "超過入力許可フラグ"
    t.boolean "auto_numbering_flg", comment: "番号自動付与フラグ"
    t.bigint "inst_org_id", comment: "学部組織ID"
    t.bigint "dept_org_id", comment: "学科組織ID"
    t.bigint "course_org_id", comment: "コース組織ID"
    t.string "prio", comment: "優先度"
    t.datetime "publish_start_from", comment: "公開開始日"
    t.datetime "publish_end_to", comment: "公開終了日"
    t.boolean "need_navlink", comment: "ナビリンク表示フラグ"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.index ["deleted_at"], name: "index_eport_reflections_on_deleted_at"
    t.index ["eport_input_category_id"], name: "idx_lti_reflections_icid"
    t.index ["eport_input_category_id"], name: "index_eport_reflections_on_eport_input_category_id"
  end

  create_table "eport_rubric_descriptions", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "eport_rubric_level_id", comment: "eポート達成度ID"
    t.string "description_cd", comment: "セル記述CD"
    t.string "description_name", comment: "セル記述名"
    t.text "description", comment: "セル記述"
    t.integer "score_from", comment: "開始ポイント"
    t.integer "score_to", comment: "終了ポイント"
    t.integer "score", comment: "評点"
    t.string "grade", comment: "評価記号"
    t.integer "display_order", comment: "表示順"
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "eport_rubric_level_item_master_id", comment: "eポート達成度アイテムマスタID"
    t.index ["eport_rubric_level_id"], name: "index_eport_rubric_descriptions_on_eport_rubric_level_id"
    t.index ["eport_rubric_level_item_master_id"], name: "index_eport_rubric_descriptions_on_item_master_id"
    t.index ["score_from"], name: "index_eport_rubric_descriptions_on_score_from"
    t.index ["score_to"], name: "index_eport_rubric_descriptions_on_score_to"
  end

  create_table "eport_rubric_level_item_masters", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "eポート達成度アイテム", force: :cascade do |t|
    t.bigint "eport_rubric_level_master_id", comment: "eポート達成度マスタID"
    t.string "item_cd", comment: "達成度アイテムCD"
    t.string "item_name", comment: "達成度アイテム名"
    t.integer "display_order", comment: "表示順"
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eport_rubric_level_master_id"], name: "index_eport_rdms_on_eport_rub_level_m_id"
  end

  create_table "eport_rubric_level_masters", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "eポート達成度マスタ", force: :cascade do |t|
    t.string "level_cd", comment: "達成度マスタCD"
    t.string "level_name", comment: "達成度マスタ名"
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eport_rubric_levels", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "level_cd", comment: "達成度CD"
    t.string "level_name", comment: "達成度名"
    t.string "level_type_cd", comment: "達成度タイプCD"
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "eport_rubric_level_master_id", comment: "eポート達成度マスタID"
    t.bigint "inst_org_id", comment: "学部組織ID"
    t.bigint "dept_org_id", comment: "学科組織ID"
    t.string "level_group_cd", comment: "グループCD"
    t.string "level_group_name", comment: "グループ名"
    t.index ["dept_org_id"], name: "index_eport_rubric_levels_on_dept_org_id"
    t.index ["eport_rubric_level_master_id"], name: "index_eport_rubric_levels_on_eport_rubric_level_master_id"
    t.index ["inst_org_id"], name: "index_eport_rubric_levels_on_inst_org_id"
  end

  create_table "eport_showcase_artifacts", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケースアーティファクトマスタ", force: :cascade do |t|
    t.bigint "eport_showcase_manage_id", comment: "LTIショーケース管理ID"
    t.string "show_for_div", comment: "ショーケース区分"
    t.text "alternatives", comment: "選択肢"
    t.integer "allow_upload_number", comment: "アップロード許可数"
    t.string "allow_upload_ext", comment: "アップロード許可拡張子"
    t.bigint "showcase_item_id", comment: "ショーケースアイテムマスタID"
    t.bigint "eport_reflection_question_id", comment: "リンク先LTI振り返り設問ID"
    t.string "input_example", comment: "定型文"
    t.string "user_attr", comment: "ユーザ属性設定"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_showcase_artifacts_on_deleted_at"
    t.index ["eport_showcase_manage_id"], name: "index_eport_showcase_artifacts_on_eport_showcase_manage_id"
  end

  create_table "eport_showcase_import_attachments", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケースインポート添付", force: :cascade do |t|
    t.bigint "eport_showcase_import_id", comment: "LTIショーケースインポートID"
    t.string "filename", comment: "ファイル名"
    t.integer "file_size", comment: "ファイルサイズ"
    t.string "document", comment: "ドキュメント"
    t.string "token", comment: "トークン"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_showcase_import_attachments_on_deleted_at"
    t.index ["eport_showcase_import_id"], name: "index_lti_showacase_import_atts_import_id"
  end

  create_table "eport_showcase_import_errors", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケースインポートエラー", force: :cascade do |t|
    t.bigint "eport_showcase_import_id", comment: "LTIショーケースインポートID"
    t.integer "line_no", comment: "行番号"
    t.string "error_message", comment: "エラーメッセージ"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_showcase_import_errors_on_deleted_at"
    t.index ["eport_showcase_import_id"], name: "index_eport_showcase_import_errors_on_eport_showcase_import_id"
  end

  create_table "eport_showcase_imports", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケースインポート", force: :cascade do |t|
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.index ["deleted_at"], name: "index_eport_showcase_imports_on_deleted_at"
  end

  create_table "eport_showcase_input_downloads", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケース入力ダウンロード", force: :cascade do |t|
    t.bigint "lms_user_id", comment: "LMSユーザID"
    t.datetime "requested_at", comment: "作成開始日時"
    t.datetime "compressed_at", comment: "作成完了日時"
    t.string "document", comment: "ドキュメント"
    t.string "filename", comment: "ファイル名"
    t.integer "filesize", comment: "ファイルサイズ"
    t.integer "inclusion_line_num", comment: "行数"
    t.boolean "created", comment: "作成状況"
    t.text "params", comment: "パラメータ"
    t.string "status", comment: "ステータス"
    t.bigint "delayed_jobs_id", comment: "DELAYED_JOB ID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.index ["deleted_at"], name: "index_eport_showcase_input_downloads_on_deleted_at"
  end

  create_table "eport_showcase_instructors", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケース担当教員", force: :cascade do |t|
    t.bigint "eport_showcase_id", comment: "LTIショーケースマスタID"
    t.bigint "student_eport_showcase_participation_id", comment: "LMSユーザID(学生）"
    t.bigint "teacher_eport_showcase_participation_id", comment: "LMSユーザID(教職員）"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.index ["deleted_at"], name: "index_eport_showcase_instructors_on_deleted_at"
  end

  create_table "eport_showcase_journal_import_attachments", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケースマスタ入力添付", force: :cascade do |t|
    t.bigint "eport_showcase_journal_import_id", comment: "LTIショーケース入力インポートID"
    t.string "filename", comment: "ファイル名"
    t.integer "file_size", comment: "ファイルサイズ"
    t.string "document", comment: "ドキュメント"
    t.string "token", comment: "トークン"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_showcase_journal_import_attachments_on_deleted_at"
    t.index ["eport_showcase_journal_import_id"], name: "index_lti_sc_journal_imp_atts_import_id"
  end

  create_table "eport_showcase_journal_import_errors", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケース入力インポートエラー", force: :cascade do |t|
    t.bigint "eport_showcase_journal_import_id", comment: "LTIショーケース入力インポートID"
    t.integer "line_no", comment: "行番号"
    t.string "error_message", comment: "エラーメッセージ"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_showcase_journal_import_errors_on_deleted_at"
    t.index ["eport_showcase_journal_import_id"], name: "index_lti_sc_journal_err_atts_import_id"
  end

  create_table "eport_showcase_journal_imports", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_showcase_journal_imports_on_deleted_at"
  end

  create_table "eport_showcase_journal_participants", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケース入力参加者", force: :cascade do |t|
    t.bigint "eport_showcase_journal_id", comment: "LTIショーケースマスタ入力ID"
    t.bigint "eport_showcase_participant_id", comment: "LTIショーケース参加者ID"
    t.datetime "sent_at", comment: "通知日時"
    t.string "send_div", comment: "通知区分"
    t.datetime "answered_at", comment: "回答日時"
    t.datetime "answer_sent_at", comment: "回答通知日時"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_showcase_journal_participants_on_deleted_at"
    t.index ["eport_showcase_journal_id"], name: "idx_lti_showcase_journal_participants_rjid"
    t.index ["sent_at"], name: "index_eport_showcase_journal_participants_on_sent_at"
  end

  create_table "eport_showcase_journals", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケース入力", force: :cascade do |t|
    t.bigint "eport_showcase_id", comment: "LTIショーケースマスタID"
    t.bigint "lms_user_id", comment: "LMSユーザID"
    t.bigint "submit_from_id", comment: "元ショーケースマスタ入力ID"
    t.integer "field_num", comment: "設問数"
    t.integer "required_field_num", comment: "必須設問数"
    t.integer "input_num", comment: "設問回答数"
    t.integer "required_input_num", comment: "必須設問回答数"
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_showcase_journals_on_deleted_at"
    t.index ["eport_showcase_id"], name: "index_eport_showcase_journals_on_eport_showcase_id"
    t.index ["lms_user_id"], name: "idx_lti_showcase_journals_luid"
    t.index ["lms_user_id"], name: "index_eport_showcase_journals_on_lms_user_id"
    t.index ["submit_from_id"], name: "idx_lti_showcase_journals_sfid"
    t.index ["submit_from_id"], name: "index_eport_showcase_journals_on_submit_from_id"
  end

  create_table "eport_showcase_manage_journal_attachments", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケース管理入力添付", force: :cascade do |t|
    t.bigint "eport_showcase_manage_journal_id", comment: "LTIショーケース管理入力ID"
    t.string "filename", comment: "ファイル名"
    t.integer "file_size", comment: "ファイルサイズ"
    t.string "document", comment: "ドキュメント"
    t.string "token", comment: "トークン"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_showcase_manage_journal_attachments_on_deleted_at"
  end

  create_table "eport_showcase_manage_journal_rubrics", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "eport_showcase_manage_journal_id", comment: "ショーケース管理回答ID"
    t.bigint "competence_id", comment: "コンピテンシーID"
    t.string "competence_name", comment: "コンピテンシー名"
    t.string "answer", comment: "回答"
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competence_id"], name: "index_eport_showcase_manage_journal_rubrics_on_competence_id"
  end

  create_table "eport_showcase_manage_journals", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケース管理入力", force: :cascade do |t|
    t.bigint "eport_showcase_journal_id", comment: "LTIショーケース入力ID"
    t.bigint "eport_showcase_manage_id", comment: "LTIショーケース管理ID"
    t.text "answer", comment: "回答"
    t.datetime "answered_at", comment: "回答日時"
    t.bigint "eport_reflection_question_journal_id", comment: "リンク先LTI振り返り入力ID"
    t.boolean "output_pdf_flag", comment: "PDF出力フラグ"
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_showcase_manage_journals_on_deleted_at"
    t.index ["eport_showcase_journal_id"], name: "idx_lti_showcase_manage_journals_jid"
    t.index ["eport_showcase_journal_id"], name: "index_eport_showcase_manage_journals_on_lti_showcase_journal_id"
    t.index ["eport_showcase_manage_id"], name: "index_lti_showcase_m_journals_on_lti_showcase_m_id"
  end

  create_table "eport_showcase_manages", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケース管理マスタ", force: :cascade do |t|
    t.bigint "eport_showcase_id", comment: "LTIショーケースID"
    t.boolean "self_assessment_flg", comment: "自己評価対象フラグ"
    t.string "self_assessment_cd", comment: "自己評価入力タイプCD"
    t.boolean "multi_assessment_flg", comment: "他者評価対象フラグ"
    t.string "multi_assessment_cd", comment: "他者評価入力タイプCD"
    t.integer "display_order", comment: "表示順"
    t.boolean "required", comment: "必須"
    t.boolean "display_title_flg", comment: "設問タイトル表示フラグ"
    t.string "title", comment: "設問タイトル"
    t.boolean "display_explanation_flg", comment: "設問説明文表示フラグ"
    t.text "explanation", comment: "設問説明文"
    t.bigint "competence_id", comment: "コンピテンシーID"
    t.boolean "allow_display_multi_assessment", comment: "自己評価者への表示許可"
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_showcase_manages_on_deleted_at"
    t.index ["eport_showcase_id"], name: "index_eport_showcase_manages_on_eport_showcase_id"
    t.index ["multi_assessment_cd"], name: "index_eport_showcase_manages_on_multi_assessment_cd"
    t.index ["self_assessment_cd"], name: "index_eport_showcase_manages_on_self_assessment_cd"
  end

  create_table "eport_showcase_part_import_attachments", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケース参加者インポート添付", force: :cascade do |t|
    t.bigint "eport_showcase_part_import_id", comment: "LTIショーケース参加者インポートID"
    t.string "filename", comment: "ファイル名"
    t.integer "file_size", comment: "ファイルサイズ"
    t.string "document", comment: "ドキュメント"
    t.string "token", comment: "トークン"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_showcase_part_import_attachments_on_deleted_at"
    t.index ["eport_showcase_part_import_id"], name: "index_lti_showcase_part_import_atts_import_id"
  end

  create_table "eport_showcase_part_import_datas", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケース参加者インポートデータ", force: :cascade do |t|
    t.string "edit_div", comment: "編集区分"
    t.string "showcase_cd", comment: "ショーケースフォームCD"
    t.string "user_id", comment: "ユーザID"
    t.string "role_div", comment: "権限区分"
    t.integer "line_no", comment: "行番号"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eport_showcase_part_import_errors", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケース参加者インポートエラー", force: :cascade do |t|
    t.bigint "eport_showcase_part_import_id", comment: "LTIショーケース参加者インポートID"
    t.integer "line_no", comment: "行番号"
    t.string "error_message", comment: "エラーメッセージ"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_showcase_part_import_errors_on_deleted_at"
    t.index ["eport_showcase_part_import_id"], name: "index_lti_showcase_part_import_err_atts_import_id"
  end

  create_table "eport_showcase_part_student_import_datas", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケース参加者担当学生インポートデータ", force: :cascade do |t|
    t.bigint "eport_showcase_student_import_data_id", comment: "LTIショーケース参加者インポートデータID"
    t.string "user_id", comment: "担当学生"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eport_showcase_participant_imports", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケース参加者インポート", force: :cascade do |t|
    t.bigint "site_id", comment: "サイトID"
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_showcase_participant_imports_on_deleted_at"
  end

  create_table "eport_showcase_participants", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケース参加者", force: :cascade do |t|
    t.bigint "eport_showcase_id", comment: "LTIショーケースマスタID"
    t.bigint "lms_user_id", comment: "LMSユーザID"
    t.string "role_div", comment: "権限区分"
    t.datetime "assigned_at", comment: "配布日時"
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_showcase_participants_on_deleted_at"
    t.index ["eport_showcase_id"], name: "index_eport_showcase_participants_on_eport_showcase_id"
    t.index ["lms_user_id"], name: "index_eport_showcase_participants_on_lms_user_id"
    t.index ["role_div"], name: "index_eport_showcase_participants_on_role_div"
  end

  create_table "eport_showcase_pdf_downloads", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケースPDFダウンロード", force: :cascade do |t|
    t.bigint "lms_user_id", comment: "LMSユーザID"
    t.datetime "requested_at", comment: "作成開始日時"
    t.datetime "compressed_at", comment: "作成完了日時"
    t.string "document", comment: "ドキュメント"
    t.string "filename", comment: "ファイル名"
    t.integer "filesize", comment: "ファイルサイズ"
    t.integer "inclusion_file_num", comment: "内包PDF数"
    t.boolean "created", comment: "作成状況"
    t.text "params", comment: "パラメータ"
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_showcase_pdf_downloads_on_deleted_at"
  end

  create_table "eport_showcases", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIショーケースマスタ", force: :cascade do |t|
    t.bigint "lti_org_id", comment: "LTI組織ID"
    t.string "showcase_cd", comment: "ショーケースCD"
    t.bigint "eport_input_category_id", comment: "LTI入力カテゴリID"
    t.string "title", comment: "タイトル"
    t.datetime "start_from", comment: "開始日"
    t.datetime "end_to", comment: "終了日"
    t.boolean "allow_when_overtime", comment: "超過日許可フラグ"
    t.boolean "auto_numbering_flg", comment: "番号自動付与フラグ"
    t.boolean "editable_flg", comment: "編集許可フラグ"
    t.boolean "allow_output_other_assessment_flg", comment: "他者評価出力要否"
    t.bigint "inst_org_id", comment: "学部組織ID"
    t.bigint "dept_org_id", comment: "学科組織ID"
    t.bigint "course_org_id", comment: "コース組織ID"
    t.bigint "copied_from_id", comment: "コピー元id"
    t.integer "copied_by", comment: "コピー者id"
    t.integer "created_by", comment: "作成者id"
    t.string "prio", comment: "優先度"
    t.datetime "publish_start_from", comment: "公開開始日"
    t.datetime "publish_end_to", comment: "公開終了日"
    t.boolean "need_navlink", comment: "ナビリンク表示フラグ"
    t.boolean "showcase_form_editor_registered", default: false, null: false, comment: "フォームエディタの基本情報保存で登録・更新した場合 true"
    t.text "layout_json", comment: "フォームエディタのグリッドレイアウトJSON"
    t.string "page_layout", comment: "ページレイアウト"
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_showcases_on_deleted_at"
    t.index ["eport_input_category_id"], name: "idx_lti_showcases_icid"
    t.index ["eport_input_category_id"], name: "index_eport_showcases_on_eport_input_category_id"
  end

  create_table "eport_usages", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI利用ガイド", force: :cascade do |t|
    t.text "message", comment: "利用ガイドメッセージ"
    t.bigint "creator_id", comment: "作成ユーザID"
    t.bigint "updater_id", comment: "更新ユーザID"
    t.bigint "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_eport_usages_on_deleted_at"
  end

  create_table "issue_custom_fields", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "issue_id"
    t.integer "custom_field_id"
    t.string "field_value"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["custom_field_id"], name: "index_issue_custom_fields_on_custom_field_id"
    t.index ["deleted_at"], name: "index_issue_custom_fields_on_deleted_at"
    t.index ["issue_id"], name: "index_issue_custom_fields_on_issue_id"
  end

  create_table "issue_targets", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "申請対象", force: :cascade do |t|
    t.integer "issue_id", comment: "申請ID"
    t.string "target_type", null: false
    t.bigint "target_id", null: false
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_issue_targets_on_deleted_at"
    t.index ["issue_id"], name: "index_issue_targets_on_issue_id"
    t.index ["target_type", "target_id"], name: "index_issue_targets_on_target"
  end

  create_table "issue_type_sites", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "issue_type_id"
    t.integer "site_id"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_issue_type_sites_on_deleted_at"
    t.index ["issue_type_id"], name: "index_issue_type_sites_on_issue_type_id"
    t.index ["site_id"], name: "index_issue_type_sites_on_site_id"
  end

  create_table "issue_types", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "issue_type_name"
    t.string "issue_type_class"
    t.string "issue_type_short_name"
    t.boolean "deletable"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_issue_types_on_deleted_at"
    t.index ["issue_type_short_name"], name: "index_issue_types_on_issue_type_short_name"
  end

  create_table "issues", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "site_id"
    t.integer "issue_type_id"
    t.integer "workflow_state_id"
    t.integer "prev_workflow_state_id"
    t.string "priority"
    t.string "title"
    t.string "expression", limit: 1000
    t.integer "assigned_id"
    t.integer "issued_id"
    t.datetime "limited_at", precision: nil
    t.datetime "deleted_at", precision: nil
    t.integer "creator_id"
    t.integer "updater_id"
    t.integer "deleter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_issues_on_deleted_at"
    t.index ["issue_type_id"], name: "index_issues_on_issue_type_id"
    t.index ["prev_workflow_state_id"], name: "index_issues_on_prev_workflow_state_id"
    t.index ["site_id"], name: "index_issues_on_site_id"
    t.index ["workflow_state_id"], name: "index_issues_on_workflow_state_id"
  end

  create_table "ken_all_postal_codes", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "code"
    t.text "address1"
    t.text "address2"
    t.text "address3"
    t.text "address_kana1"
    t.text "address_kana2"
    t.text "address_kana3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_ken_all_postal_codes_on_code"
  end

  create_table "lms_user_custom_fields", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "lms_user_id"
    t.integer "custom_field_id"
    t.string "field_value"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["custom_field_id"], name: "index_lms_user_custom_fields_on_custom_field_id"
    t.index ["deleted_at"], name: "index_lms_user_custom_fields_on_deleted_at"
    t.index ["lms_user_id"], name: "index_lms_user_custom_fields_on_lms_user_id"
  end

  create_table "lms_user_import_attachments", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LMSユーザインポート添付", force: :cascade do |t|
    t.integer "lms_user_import_id", comment: "LTI振り返りインポートID"
    t.string "filename", comment: "ファイル名"
    t.integer "file_size", comment: "ファイルサイズ"
    t.string "document", comment: "ドキュメント"
    t.string "token", comment: "トークン"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_lms_user_import_attachments_on_deleted_at"
    t.index ["lms_user_import_id"], name: "index_lms_user_import_atts_import_id"
  end

  create_table "lms_user_import_errors", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LMSユーザインポートエラー", force: :cascade do |t|
    t.integer "lms_user_import_id", comment: "LMSユーザインポートID"
    t.integer "line_no", comment: "行番号"
    t.string "error_message", comment: "エラーメッセージ"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_lms_user_import_errors_on_deleted_at"
    t.index ["lms_user_import_id"], name: "index_lms_user_import_errors_on_lms_user_import_id"
  end

  create_table "lms_user_imports", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LMSユーザインポート", force: :cascade do |t|
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id", comment: "作成ユーザID"
    t.integer "updater_id", comment: "更新ユーザID"
    t.integer "deleter_id", comment: "削除ユーザID"
    t.index ["deleted_at"], name: "index_lms_user_imports_on_deleted_at"
  end

  create_table "lms_user_sites", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LMSユーザサイト", force: :cascade do |t|
    t.integer "lms_user_id", comment: "LMSユーザID"
    t.integer "site_id", comment: "サイトID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_lms_user_sites_on_deleted_at"
    t.index ["lms_user_id"], name: "index_lms_user_sites_on_lms_user_id"
    t.index ["site_id"], name: "index_lms_user_sites_on_site_id"
  end

  create_table "lms_users", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LMSユーザ", force: :cascade do |t|
    t.string "username", comment: "ユーザID"
    t.string "name", comment: "氏名"
    t.string "given_name", comment: "姓"
    t.string "family_name", comment: "名"
    t.string "email", comment: "Eメール"
    t.string "lms", comment: "登録元LMS"
    t.string "role", comment: "権限"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lti_org_id", comment: "LTI組織ID"
    t.integer "inst_org_id", comment: "学部組織ID"
    t.integer "dept_org_id", comment: "学科組織ID"
    t.integer "course_org_id", comment: "コース組織ID"
    t.integer "admin_user_id", comment: "ユーザID"
    t.integer "lms_user_id", comment: "LMSユーザID"
    t.index ["deleted_at"], name: "index_lms_users_on_deleted_at"
  end

  create_table "lti_caches", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIキャッシュ", force: :cascade do |t|
    t.string "launch_id", comment: "起動ID"
    t.string "nonce", comment: "ナンス値"
    t.text "data", comment: "キャッシュデータ"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_lti_caches_on_deleted_at"
    t.index ["launch_id"], name: "index_lti_caches_on_launch_id"
    t.index ["nonce"], name: "index_lti_caches_on_nonce"
  end

  create_table "lti_database_sites", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIデータベースサイト", force: :cascade do |t|
    t.integer "lti_database_id", comment: "LTIデータベースID"
    t.integer "site_id", comment: "サイトID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_lti_database_sites_on_deleted_at"
    t.index ["lti_database_id"], name: "index_lti_database_sites_on_lti_database_id"
    t.index ["site_id"], name: "index_lti_database_sites_on_site_id"
  end

  create_table "lti_databases", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIデータベース", force: :cascade do |t|
    t.string "name", comment: "名前"
    t.string "iss", null: false
    t.string "client_id"
    t.string "auth_login_url"
    t.string "auth_token_url"
    t.string "key_set_url"
    t.text "private_key_file"
    t.string "kid"
    t.string "deployment_json"
    t.text "public_key", comment: "公開鍵"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_lti_databases_on_deleted_at"
    t.index ["iss"], name: "index_lti_databases_on_iss"
  end

  create_table "lti_import_histories", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIインポート履歴", force: :cascade do |t|
    t.string "target_type", comment: "インポートタイプ"
    t.integer "target_id", comment: "履歴ID"
    t.integer "provider_job_id", comment: "delayed_job ID"
    t.integer "creator_id", comment: "作成ユーザID"
    t.integer "updater_id", comment: "更新ユーザID"
    t.integer "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_lti_import_histories_on_deleted_at"
    t.index ["target_type", "target_id"], name: "index_lti_import_histories_on_target_type_and_target_id", unique: true
  end

  create_table "lti_operation_logs", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI操作ログ", force: :cascade do |t|
    t.datetime "operated_at", comment: "操作日時"
    t.string "form_type", comment: "対象"
    t.integer "lms_user_id", comment: "LMSユーザID"
    t.string "user_id", comment: "ユーザID"
    t.string "user_name", comment: "ユーザ名"
    t.integer "inst_org_id", comment: "学部ID"
    t.string "institution", comment: "学部名"
    t.integer "dept_org_id", comment: "学科ID"
    t.string "department", comment: "学科名"
    t.integer "course_org_id", comment: "コースID"
    t.string "operation_log_target_type", comment: "対象"
    t.integer "operation_log_target_id", comment: "フォームID"
    t.string "screen_name", comment: "画面名"
    t.string "operation_div", comment: "操作区分"
    t.text "description", comment: "説明"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id", comment: "作成ユーザID"
    t.integer "updater_id", comment: "更新ユーザID"
    t.integer "deleter_id", comment: "削除ユーザID"
    t.integer "input_category_id", comment: "カテゴリID"
    t.string "input_category_name", comment: "カテゴリ名"
    t.integer "form_cd", comment: "フォームCD"
    t.string "form_name", comment: "フォーム名"
    t.index ["deleted_at"], name: "index_lti_operation_logs_on_deleted_at"
  end

  create_table "lti_orgs", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI組織", force: :cascade do |t|
    t.string "org_cd", comment: "組織CD"
    t.string "org_name", comment: "組織名"
    t.integer "parent_org_id", comment: "親組織CD"
    t.string "org_div", comment: "組織区分"
    t.string "ancestry", comment: "階層"
    t.integer "creator_id", comment: "作成ユーザID"
    t.integer "updater_id", comment: "更新ユーザID"
    t.integer "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_lti_orgs_on_deleted_at"
    t.index ["org_cd"], name: "index_lti_orgs_on_org_cd"
  end

  create_table "lti_usages", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI利用ガイド", force: :cascade do |t|
    t.text "message", comment: "利用ガイドメッセージ"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id", comment: "作成ユーザID"
    t.integer "updater_id", comment: "更新ユーザID"
    t.integer "deleter_id", comment: "削除ユーザID"
    t.index ["deleted_at"], name: "index_lti_usages_on_deleted_at"
  end

  create_table "mail_template_sites", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "mail_template_id"
    t.integer "site_id"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_mail_template_sites_on_deleted_at"
    t.index ["mail_template_id"], name: "index_mail_template_sites_on_mail_template_id"
    t.index ["site_id"], name: "index_mail_template_sites_on_site_id"
  end

  create_table "mail_templates", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "template_div"
    t.string "template_name"
    t.string "from_address"
    t.string "to_address"
    t.string "subject"
    t.string "body", limit: 1000
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enable", comment: "有効フラグ"
    t.boolean "disable_notice", comment: "通知無効フラグ"
    t.index ["deleted_at"], name: "index_mail_templates_on_deleted_at"
  end

  create_table "queries", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "admin_user_id"
    t.string "title"
    t.string "query_content", limit: 1000
    t.string "target_class"
    t.string "query_fields", limit: 1000
    t.string "selected_query_fields", limit: 1000
    t.boolean "shared"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_queries_on_admin_user_id"
    t.index ["deleted_at"], name: "index_queries_on_deleted_at"
  end

  create_table "report_attachments", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "report_id"
    t.string "filename"
    t.integer "file_size"
    t.string "document"
    t.string "token"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_report_attachments_on_deleted_at"
    t.index ["report_id"], name: "index_report_attachments_on_report_id"
  end

  create_table "report_sites", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "report_id"
    t.integer "site_id"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_report_sites_on_deleted_at"
    t.index ["report_id"], name: "index_report_sites_on_report_id"
    t.index ["site_id"], name: "index_report_sites_on_site_id"
  end

  create_table "reports", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "title"
    t.string "report_class"
    t.string "description", limit: 1000
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_reports_on_deleted_at"
  end

  create_table "role_actions", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "controller_name"
    t.string "controller_path"
    t.string "display_name"
    t.string "action_name"
    t.string "action_display_name"
    t.string "auth_as"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_role_actions_on_deleted_at"
  end

  create_table "role_role_actions", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "role_id"
    t.integer "role_action_id"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_role_role_actions_on_deleted_at"
    t.index ["role_action_id"], name: "index_role_role_actions_on_role_action_id"
    t.index ["role_id"], name: "index_role_role_actions_on_role_id"
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "role_name"
    t.string "role_short_name"
    t.boolean "deletable"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_roles_on_deleted_at"
  end

  create_table "sessions", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data", size: :medium
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "sites", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "site_name"
    t.string "status_div", default: "before_apply"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_sites_on_deleted_at"
  end

  create_table "state_flow_workflow_states", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "state_flow_id"
    t.integer "current_workflow_state_id"
    t.integer "next_workflow_state_id"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["current_workflow_state_id"], name: "index_state_flow_workflow_states_on_current_workflow_state_id"
    t.index ["deleted_at"], name: "index_state_flow_workflow_states_on_deleted_at"
    t.index ["next_workflow_state_id"], name: "index_state_flow_workflow_states_on_next_workflow_state_id"
    t.index ["state_flow_id"], name: "index_state_flow_workflow_states_on_state_flow_id"
  end

  create_table "state_flows", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "workflow_id"
    t.integer "role_id"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_state_flows_on_deleted_at"
    t.index ["role_id"], name: "index_state_flows_on_role_id"
    t.index ["workflow_id"], name: "index_state_flows_on_workflow_id"
  end

  create_table "system_setting_attachments", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "system_setting_id"
    t.string "type_div"
    t.string "filename"
    t.integer "file_size"
    t.string "document"
    t.string "token"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_system_setting_attachments_on_deleted_at"
    t.index ["system_setting_id"], name: "index_system_setting_attachments_on_system_setting_id"
  end

  create_table "system_setting_sites", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "system_setting_id"
    t.integer "site_id"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_system_setting_sites_on_deleted_at"
    t.index ["site_id"], name: "index_system_setting_sites_on_site_id"
    t.index ["system_setting_id"], name: "index_system_setting_sites_on_system_setting_id"
  end

  create_table "system_settings", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "setting_category_div", limit: 20
    t.string "setting_div", limit: 20
    t.string "setting_value", limit: 16000, comment: "設定値"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_system_settings_on_deleted_at"
  end

  create_table "versions", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "item_type", limit: 191, null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", size: :long
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "workflow_sites", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "workflow_id"
    t.integer "site_id"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_workflow_sites_on_deleted_at"
    t.index ["site_id"], name: "index_workflow_sites_on_site_id"
    t.index ["workflow_id"], name: "index_workflow_sites_on_workflow_id"
  end

  create_table "workflow_states", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "workflow_id"
    t.string "state_cd"
    t.string "state_name"
    t.boolean "default_value"
    t.boolean "end_point"
    t.integer "display_order"
    t.boolean "deleted_state"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_workflow_states_on_deleted_at"
  end

  create_table "workflows", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "workflow_name"
    t.integer "issue_type_id"
    t.boolean "deletable"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_workflows_on_deleted_at"
    t.index ["issue_type_id"], name: "index_workflows_on_issue_type_id"
  end

  add_foreign_key "eport_competences", "eport_rubric_levels", on_delete: :nullify
  add_foreign_key "eport_rubric_levels", "eport_rubric_level_masters", on_delete: :nullify
end
