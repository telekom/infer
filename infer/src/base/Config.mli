(*
 * Copyright (c) 2009-2013, Monoidics ltd.
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

open! IStd

(** Configuration values: either constant, determined at compile time, or set at startup time by
    system calls, environment variables, or command line options *)

type os_type = Unix | Win32 | Cygwin

type build_system =
  | BAnt
  | BBuck
  | BBuck2
  | BClang
  | BErlc
  | BGradle
  | BHackc
  | BJava
  | BJavac
  | BKotlinc
  | BMake
  | BMvn
  | BNdk
  | BPython
  | BRebar3
  | BXcode

type scheduler = File | Restart | SyntacticCallGraph [@@deriving equal]

val string_of_scheduler : scheduler -> string

val build_system_of_exe_name : string -> build_system

val string_of_build_system : build_system -> string

val env_inside_maven : Unix.env

(** {2 Constant configuration values} *)

val allow_listed_cpp_classes : string list

val allow_listed_cpp_methods : string list

val anonymous_block_prefix : string

val biabduction_models_jar : string

val biabduction_models_sql : string

val bin_dir : string

val bound_error_allowed_in_procedure_call : bool

val clang_exe_aliases : string list

val clang_initializer_prefix : string

val clang_inner_destructor_prefix : string

val clang_plugin_path : string

val default_failure_name : string

val dotty_frontend_output : string

val etc_dir : string

val fail_on_issue_exit_code : int

val fcp_dir : string

val idempotent_getters : bool

val initial_analysis_time : float

val is_running_unit_test : bool
(** whether the infer executable looks like we are just running infer unit tests *)

val java_lambda_marker_infix_generated_by_javalib : string
(** marker to recognize methods generated by javalib to eliminate lambdas *)

val java_lambda_marker_prefix_generated_by_javac : string
(** marker to recognize methods generated by javac to build closures *)

val kotlin_source_extension : string

val lib_dir : string

val max_narrows : int

val max_widens : int

val meet_level : int

val nsnotification_center_checker_backend : bool

val os_type : os_type

val pp_version : Format.formatter -> unit -> unit

val report_nullable_inconsistency : bool

val save_compact_summaries : bool

val smt_output : bool

val wrappers_dir : string

(** {2 Configuration values specified by command-line options} *)

val abstract_pulse_models_for_erlang : bool

val analysis_schedule_file : string option

val annotation_reachability_apply_superclass_annotations : bool

val annotation_reachability_custom_models : Yojson.Safe.t

val annotation_reachability_custom_pairs : Yojson.Safe.t

val annotation_reachability_expensive : bool

val annotation_reachability_minimize_sources : bool

val annotation_reachability_no_allocation : bool

val annotation_reachability_report_source_and_sink : bool

val append_buck_flavors : string list

val biabduction_abs_struct : int

val biabduction_abs_val : int

val biabduction_allow_leak : bool

val biabduction_array_level : int

val biabduction_iterations : int

val biabduction_join_cond : int

val biabduction_memleak_buckets :
  [`MLeak_all | `MLeak_arc | `MLeak_cf | `MLeak_cpp | `MLeak_no_arc | `MLeak_unknown] list

val biabduction_models_mode : bool

val biabduction_monitor_prop_size : bool

val biabduction_nelseg : bool

val biabduction_only_footprint : bool

val biabduction_seconds_per_iteration : float option

val biabduction_symops_per_iteration : int option

val biabduction_trace_join : bool

val biabduction_trace_rearrange : bool

val biabduction_type_size : bool

val biabduction_unsafe_malloc : bool

val biabduction_worklist_mode : int

val biabduction_write_dotty : bool

val bo_assume_void : bool

val bo_bottom_as_default : bool

val bo_context_sensitive_allocsites : bool

val bo_debug : int

val bo_exit_frontend_gener_vars : bool

val bo_field_depth_limit : int option

val bo_max_cfg_size : int

val bo_sound_unknown_sets_join : bool

val bootclasspath : string option

val buck : bool

val buck2_build_args : string list

val buck2_build_args_no_inline : string list

val buck2_bxl_capture_file_block_list : string list

val buck2_bxl_target : string option

val buck2_inferconfig_target : string option

val buck2_infertoolchain_target : string option

val buck2_isolation_dir : string option

val buck2_query_deps : bool

val buck2_root : string

val buck_block_list : string list

val buck_build_args : string list

val buck_build_args_no_inline : string list

val buck_cache_mode : bool

val buck_clang_use_toolchain_config : bool

val buck_dependency_depth : int option

val buck_java_heap_size_gb : int option

val buck_java_suppress_config : bool

val buck_merge_all_deps : bool

val buck_mode : BuckMode.t option

val buck_out : string

val buck_out_gen : string

val buck_targets_block_list : string list

val capture : bool

val capture_block_list : string * Yojson.Safe.t

val capture_textual : string list

val censor_report : ((bool * Str.regexp) * (bool * Str.regexp) * string) list

val cfg_json : string option

val changed_files_index : string option

val check_version : string option

val clang_ast_file : [`Biniou of string | `Yojson of string] option

val clang_block_listed_flags : string list

val clang_block_listed_flags_with_arg : string list

val clang_compound_literal_init_limit : int

val clang_extra_flags : string list

val clang_frontend_action_string : string

val clang_idirafter_to_override_regex : Str.regexp option

val clang_ignore_regex : Str.regexp option

val clang_isystem_to_override_regex : Str.regexp option

val clang_libcxx_include_to_override_regex : string option

val classpath : string option

val command : InferCommand.t

val compaction_if_heap_greater_equal_to_GB : int

val compaction_minimum_interval_s : int

val complete_capture_from : string option

val config_impact_config_field_patterns : Str.regexp list

val config_impact_config_function_patterns : Str.regexp list

val config_impact_config_param_patterns : Str.regexp list

val config_impact_current : string option

val config_impact_data_file : string option

val config_impact_issues_tests : string option

val config_impact_max_callees_to_print : int

val config_impact_previous : string option

val config_impact_strict_mode : bool

val config_impact_strict_mode_paths : Str.regexp list

val config_impact_test_paths : Str.regexp list

val continue_analysis : bool

val continue_capture : bool

val cost_issues_tests : string option

val cost_log_unknown_calls : bool

val cost_suppress_func_ptr : bool

val costs_current : string option

val costs_previous : string option

val cxx : bool

val cxx_scope_guards : Yojson.Safe.t

val data_flow_queries_on_topl : string list

val dbwriter : bool

val debug_exceptions : bool

val debug_level_analysis : int

val debug_level_capture : int

val debug_level_report : int

val debug_mode : bool

val deduplicate : bool

val dependency_mode : bool

val detach_analysis_dependency : bool

val developer_mode : bool

val dict_missing_key_var_block_list : Str.regexp option

val differential_filter_files : string option

val differential_filter_set : [`Introduced | `Fixed | `Preexisting] list

val dotty_cfg_libs : bool

val dump_duplicate_symbols : bool

val dump_textual : bool

val dynamic_dispatch_json_file_path : string option

val erlang_ast_dir : string option

val erlang_check_return : bool

val erlang_list_unfold_depth : int

val erlang_reliability : bool

val erlang_skip_compile : bool

val erlang_with_otp_specs : bool

val extract_capture_from : string option

val fail_on_bug : bool

val fcp_apple_clang : string option

val fcp_syntax_only : bool

val file_renamings : string option

val files_to_analyze_index : string option

val filter_paths : bool

val filtering : bool

val force_delete_results_dir : bool

val force_integration : build_system option

val from_json_config_impact_report : string

val from_json_costs_report : string

val from_json_report : string

val frontend_stats : bool

val frontend_tests : bool

val generated_classes : string option

val genrule_mode : bool

val global_tenv : bool

val hackc_binary : string option

val hack_builder_patterns : (string * string list) list

val hack_builtin_models : string

val hack_models : string list

val hack_naming_table : string option [@@warning "-unused-value-declaration"]

val hack_verify_capture_only : bool

val help_checker : Checker.t list

val help_issue_type : IssueType.t list

val hoisting_report_only_expensive : bool

val html : bool

val icfg_dotty_outfile : string option

val implicit_sdk_root : string option

val impurity_report_immutable_modifications : bool

val inclusive_cost : bool

val incremental_analysis : bool

val infer_binary : string
(** absolute canonicalized path to the current executable *)

val infer_is_clang : bool

val infer_is_javac : bool

val inferconfig_file : string option

val inline_func_pointer_for_testing : string option

val invalidate_only : bool

val is_checker_enabled : Checker.t -> bool

val issues_tests : string option

val issues_tests_fields : IssuesTestField.t list

val java_debug_source_file_info : string option

val java_jar_compiler : string option

val java_read_modules : bool

val java_source_parser_experimental : bool

val java_version : int option

val javac_classes_out : string

val job_id : string option

val jobs : int

val keep_going : bool

val kotlin_capture : bool

val lineage_source : string list

val lineage_sink : string list

val lineage_sanitizers : string list

val lineage_limit : int option

val lineage_dedup : bool

val lineage_field_depth : int

val lineage_field_max_cfg_size : int option

val lineage_field_width : int

val lineage_include_builtins : bool

val lineage_json_report : bool

val lineage_keep_temporaries : bool

val lineage_max_cfg_size : int option

val lineage_prevent_cycles : bool

val lineage_seed : int

val lineage_variant_width : int

val list_categories : bool

val list_checkers : bool

val list_issue_types : bool

val liveness_block_list_var_regex : Str.regexp option

val liveness_dangerous_classes : Yojson.Safe.t

val liveness_ignored_constant : string list

val load_average : float option

val lock_model : Yojson.Safe.t

val log_pulse_disjunct_increase_after_model_call : bool

val log_pulse_coverage : bool

val log_missing_deps : bool

val margin_html : int

val mark_unchanged_procs : bool

val mask_sajwa_exceptions : bool

val max_nesting : int option

val memtrace_analysis : bool

val memtrace_sampling_rate : float

val merge_capture : string list

val merge_report : string list

val merge_summaries : string list

val modeled_expensive : string * Yojson.Safe.t

val never_returning_null : string * Yojson.Safe.t

val noescaping_function_list : string list

val no_censor_report : Str.regexp list

val no_translate_libs : bool

val nullable_annotation : string option

val only_cheap_debug : bool

val oom_threshold : int option

val objc_block_execution_macro : string option

val objc_synthesize_dealloc : bool

val pmd_xml : bool

val preanalysis_html : bool

val print_active_checkers : bool

val print_builtins : bool

val print_jbir : bool

val print_logs : bool

val print_types : bool

val print_using_diff : bool

val procedures : bool

val procedures_attributes : bool

val procedures_call_graph : bool

val procedures_callees : bool

val procedures_cfg : bool

val procedures_definedness : bool

val procedures_filter : string option

val procedures_name : bool

val procedures_source_file : bool

val procedures_summary : bool

val procedures_summary_json : bool

val procedures_summary_skip_empty : bool

val process_clang_ast : bool

val procs_to_analyze_index : string option

val progress_bar : [`MultiLine | `Plain | `Quiet]

val project_root : string

val pulse_balanced_disjuncts_strategy : bool

val pulse_cut_to_one_path_procedures_pattern : Str.regexp option

val pulse_force_continue : bool

val pulse_havoc_arguments : bool

val pulse_inline_global_init_func_pointer : bool

val pulse_intraprocedural_only : bool

val pulse_log_summary_count : bool

val pulse_log_unknown_calls : bool

val pulse_log_unknown_calls_sampled : int option

val pulse_max_cfg_size : int

val pulse_max_disjuncts : int

val pulse_max_heap : int option

val pulse_model_abort : string list

val pulse_model_alloc_pattern : Str.regexp option

val pulse_model_cheap_copy_type : Str.regexp option

val pulse_model_free_pattern : Str.regexp option

val pulse_model_malloc_pattern : Str.regexp option

val pulse_model_realloc_pattern : Str.regexp option

val pulse_model_release_pattern : Str.regexp option

val pulse_model_return_first_arg : Str.regexp option

val pulse_model_return_nonnull : Str.regexp option

val pulse_model_return_this : Str.regexp option

val pulse_model_returns_copy_pattern : Str.regexp option

val pulse_model_skip_pattern : Str.regexp option

val pulse_model_transfer_ownership : string list

val pulse_model_transfer_ownership_namespace : (string * string) list

val pulse_models_for_erlang : string list

val pulse_monitor_transitive_callees : bool

val pulse_monitor_transitive_missed_captures : bool

val pulse_nullsafe_report_npe : bool

val pulse_nullsafe_report_npe_as_separate_issue_type : bool

val pulse_prevent_non_disj_top : bool

val pulse_recency_limit : int

val pulse_report_flows_from_taint_source : string option

val pulse_report_flows_to_taint_sink : string option

val pulse_report_issues_for_tests : bool

val pulse_report_latent_issues : bool

val pulse_sanity_checks : bool

val pulse_skip_procedures : Str.regexp option

val pulse_specialization_iteration_limit : int

val pulse_specialization_limit : int

val pulse_specialization_partial : bool

type pulse_taint_config =
  { sources: Pulse_config_t.matchers
  ; sanitizers: Pulse_config_t.matchers
  ; propagators: Pulse_config_t.matchers
  ; sinks: Pulse_config_t.matchers
  ; policies: Pulse_config_t.taint_policies
  ; data_flow_kinds: string list }

val pulse_taint_config : pulse_taint_config

val pulse_taint_follow_field_accesses : bool

val pulse_taint_opaque_files : string list

val pulse_taint_short_traces : bool

val pulse_taint_skip_sources : bool

val pulse_transitive_access_config : string list

val pulse_transitive_access_enabled : bool

val pulse_transitive_access_verbose : bool

val pulse_unsafe_malloc : bool

val pulse_widen_threshold : int

val pure_by_default : bool

val pyc_file : string list

val python_builtin_models : string

val qualified_cpp_name_block_list : string list

val quiet : bool

val racerd_always_report_java : bool

val racerd_guardedby : bool

val racerd_ignore_classes : String.Set.t

val reactive_mode : bool

val reactive_capture : bool

val reanalyze : bool

val relative_path_backtrack : int

val replay_analysis_schedule : bool

val replay_ondemand_should_error : bool

val report : bool

val report_block_list_spec : Report_block_list_spec_t.report_block_list_specs

val report_block_list_files_containing : string list

val report_console_limit : int option

val report_current : string option

val report_custom_error : bool

val report_force_relative_path : bool

val report_formatter : [`No_formatter | `Phabricator_formatter]

val report_path_regex_allow_list : string list

val report_path_regex_block_list : string list

val report_previous : string option

val report_suppress_errors : string list

val reports_include_ml_loc : bool

val rest : string list

val results_dir : string

val run_as_child : int option

val sarif : bool

val scheduler : scheduler

val scope_leakage_config : Yojson.Safe.t

val scuba_logging : bool

val scuba_normals : string String.Map.t

val scuba_tags : string list String.Map.t

val select : [`All | `Select of int] option

val show_buckets : bool

val shrink_analysis_db : bool

val siof_check_iostreams : bool

val siof_safe_methods : string list

val skip_analysis_in_path : Str.regexp option

val skip_analysis_in_path_skips_compilation : bool

val skip_duplicated_types : bool

val skip_non_capture_clang_commands : bool

val skip_translation_headers : string list

val source_files : bool

val source_files_call_graph : bool

val source_files_call_graph_partition : int option

val source_files_cfg : bool

val source_files_filter : string option

val source_files_freshly_captured : bool

val source_files_procedure_names : bool

val source_files_type_environment : bool

val source_preview : bool

val sourcepath : string option

val sources : string list

val sqlite_cache_size : int

val sqlite_lock_timeout : int

val sqlite_max_blob_size : int

val sqlite_mmap_size : int

val sqlite_page_size : int

val sqlite_vfs : string option

val starvation_c_function_pointer_models : Yojson.Safe.t

val starvation_c_named_threads_annot : Yojson.Safe.t

val starvation_skip_analysis : Yojson.Safe.t

val starvation_strict_mode : bool

val starvation_whole_program : bool

val stats_dir_current : string option

val stats_dir_previous : string option

val struct_as_cpp_class : bool

val store_analysis_schedule : bool

val subtype_multirange : bool

val suffix_match_changed_files : bool

val summaries_caches_max_size : int [@@warning "-unused-value-declaration"]

val suppress_lint_ignore_types : bool

val suppressions : bool

val tenv_json : string option

val testing_mode : bool

val threadsafe_aliases : Yojson.Safe.t

val timeout : float option

val top_longest_proc_duration_size : int option

val topl_max_conjuncts : int

val topl_max_disjuncts : int

val topl_properties : ToplAst.t list

val topl_report_latent_issues : bool

val trace_absarray : bool

val trace_error : bool

val trace_events : bool

val trace_ondemand : bool

val trace_topl : bool

val unix_fork : bool

val workspace : string option

val write_html : bool

val write_html_allow_list_regex : string list

val write_website : string option

val xcode_developer_dir : string option

val xcode_isysroot_suffix : string option

val xcpretty : bool

(** {2 Configuration values derived from command-line options} *)

val toplevel_results_dir : string
(** In some integrations, eg Buck, infer subprocesses started by the build system (started by the
    toplevel infer process) will have their own results directory; this points to the results
    directory of the toplevel infer process, which can be useful for, eg, storing debug info. In
    other cases this is equal to {!results_dir}. *)

val java_package_is_external : string -> bool
(** Check if a Java package is external to the repository *)

val scuba_execution_id : Int64.t option
(** a random number to (hopefully) uniquely identify this run *)

val is_originator : bool
(** is the current process (forked from) the root of the Infer process tree *)

(** {2 Global variables with initial values specified by command-line options} *)

val clang_compilation_dbs : [`Escaped of string | `Raw of string] list
