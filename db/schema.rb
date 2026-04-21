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

ActiveRecord::Schema[7.0].define(version: 2026_04_20_154441) do
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

  create_table "canvas_lms_user_subaccounts", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "CAVASLMSユーザサブアカウント", force: :cascade do |t|
    t.integer "lms_user_id", comment: "LMSユーザID"
    t.integer "canvas_subaccount_id", comment: "CAVASサブアカウントID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id", comment: "作成ユーザID"
    t.integer "updater_id", comment: "更新ユーザID"
    t.integer "deleter_id", comment: "削除ユーザID"
    t.index ["deleted_at"], name: "index_canvas_lms_user_subaccounts_on_deleted_at"
  end

  create_table "canvas_subaccounts", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "CAVASサブアカウント", force: :cascade do |t|
    t.integer "parent_canvas_subaccount_id", comment: "親CAVASサブアカウントID"
    t.integer "canvas_subaccount_id", comment: "CAVASサブアカウントID"
    t.string "canvas_subaccount_name", comment: "CANVASサブアカウント名"
    t.string "ancestry", comment: "階層"
    t.string "parent_account_id_from_api", comment: "APIで取得した親アカウントID"
    t.string "uuid", comment: "UUID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id", comment: "作成ユーザID"
    t.integer "updater_id", comment: "更新ユーザID"
    t.integer "deleter_id", comment: "削除ユーザID"
    t.index ["deleted_at"], name: "index_canvas_subaccounts_on_deleted_at"
    t.index ["parent_canvas_subaccount_id"], name: "index_canvas_subaccounts_on_parent_canvas_subaccount_id"
  end

  create_table "canvas_usages", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "CanvasAdmin利用ガイド", force: :cascade do |t|
    t.text "message", comment: "利用ガイドメッセージ"
    t.integer "creator_id", comment: "作成ユーザID"
    t.integer "updater_id", comment: "更新ユーザID"
    t.integer "deleter_id", comment: "削除ユーザID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_canvas_usages_on_deleted_at"
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
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "public_key", comment: "公開鍵"
    t.index ["deleted_at"], name: "index_lti_databases_on_deleted_at"
    t.index ["iss"], name: "index_lti_databases_on_iss"
  end

  create_table "lti_import_histories", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTIインポート履歴", force: :cascade do |t|
    t.string "target_type", comment: "インポートタイプ"
    t.integer "target_id", comment: "履歴ID"
    t.integer "provider_job_id", comment: "delayed_job ID"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id", comment: "作成ユーザID"
    t.integer "updater_id", comment: "更新ユーザID"
    t.integer "deleter_id", comment: "削除ユーザID"
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
    t.index ["deleted_at"], name: "index_lti_operation_logs_on_deleted_at"
  end

  create_table "lti_orgs", charset: "utf8mb4", collation: "utf8mb4_general_ci", comment: "LTI組織", force: :cascade do |t|
    t.string "org_cd", comment: "組織CD"
    t.string "org_name", comment: "組織名"
    t.integer "parent_org_id", comment: "親組織CD"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "org_div", comment: "組織区分"
    t.string "ancestry", comment: "階層"
    t.integer "creator_id", comment: "作成ユーザID"
    t.integer "updater_id", comment: "更新ユーザID"
    t.integer "deleter_id", comment: "削除ユーザID"
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

end
