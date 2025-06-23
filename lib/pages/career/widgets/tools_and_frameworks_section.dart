import 'package:flutter/material.dart';
import 'tool_chip.dart';

class ToolsAndFrameworksSection extends StatefulWidget {
  final List<Map<String, dynamic>> programmingLanguages;
  final List<Map<String, dynamic>> frameworks;
  final List<Map<String, dynamic>> versionControl;
  final List<Map<String, dynamic>> dataProcessing;
  final List<Map<String, dynamic>> containerOrchestration;
  final List<Map<String, dynamic>> databases;
  final List<Map<String, dynamic>> cicdDevOps;
  final List<Map<String, dynamic>> operatingSystems;
  final VoidCallback? onSectionComplete;

  const ToolsAndFrameworksSection({
    super.key,
    required this.programmingLanguages,
    required this.frameworks,
    required this.versionControl,
    required this.dataProcessing,
    required this.containerOrchestration,
    required this.databases,
    required this.cicdDevOps,
    required this.operatingSystems,
    this.onSectionComplete,
  });

  @override
  State<ToolsAndFrameworksSection> createState() =>
      _ToolsAndFrameworksSectionState();
}

class _ToolsAndFrameworksSectionState extends State<ToolsAndFrameworksSection> {
  List<bool> showLanguagesChips = [];
  List<bool> showFrameworksChips = [];
  List<bool> showVersionControlChips = [];
  List<bool> showDataProcessingChips = [];
  List<bool> showContainerOrchestrationChips = [];
  List<bool> showDatabasesChips = [];
  List<bool> showCicdDevOpsChips = [];
  List<bool> showOperatingSystemsChips = [];

  bool showLanguagesSection = false;
  bool showFrameworksSection = false;
  bool showVersionControlSection = false;
  bool showDataProcessingSection = false;
  bool showContainerOrchestrationSection = false;
  bool showDatabasesSection = false;
  bool showCicdDevOpsSection = false;
  bool showOperatingSystemsSection = false;
  @override
  void initState() {
    super.initState();
    showLanguagesChips = List.filled(widget.programmingLanguages.length, false);
    showFrameworksChips = List.filled(widget.frameworks.length, false);
    showVersionControlChips = List.filled(widget.versionControl.length, false);
    showDataProcessingChips = List.filled(widget.dataProcessing.length, false);
    showContainerOrchestrationChips = List.filled(
      widget.containerOrchestration.length,
      false,
    );
    showDatabasesChips = List.filled(widget.databases.length, false);
    showCicdDevOpsChips = List.filled(widget.cicdDevOps.length, false);
    showOperatingSystemsChips = List.filled(
      widget.operatingSystems.length,
      false,
    );
    _startSequentialAnimation();
  }

  void _startSequentialAnimation() async {
    // Show Languages section first
    if (mounted) setState(() => showLanguagesSection = true);
    await _animateChips(widget.programmingLanguages, showLanguagesChips);

    // Show Frameworks section
    if (mounted) setState(() => showFrameworksSection = true);
    await _animateChips(widget.frameworks, showFrameworksChips);

    // Show Version Control section
    if (mounted) setState(() => showVersionControlSection = true);
    await _animateChips(widget.versionControl, showVersionControlChips);

    // Show Data Processing section
    if (mounted) setState(() => showDataProcessingSection = true);
    await _animateChips(widget.dataProcessing, showDataProcessingChips);

    // Show Container Orchestration section
    if (mounted) setState(() => showContainerOrchestrationSection = true);
    await _animateChips(
      widget.containerOrchestration,
      showContainerOrchestrationChips,
    );

    // Show Databases section
    if (mounted) setState(() => showDatabasesSection = true);
    await _animateChips(widget.databases, showDatabasesChips);

    // Show CI/CD & DevOps section
    if (mounted) setState(() => showCicdDevOpsSection = true);
    await _animateChips(widget.cicdDevOps, showCicdDevOpsChips);

    // Show Operating Systems section
    if (mounted) setState(() => showOperatingSystemsSection = true);
    await _animateChips(widget.operatingSystems, showOperatingSystemsChips);

    // Notify parent that this section is complete
    if (widget.onSectionComplete != null) {
      widget.onSectionComplete!();
    }
  }

  Future<void> _animateChips(
    List<Map<String, dynamic>> items,
    List<bool> showFlags,
  ) async {
    for (int i = 0; i < items.length; i++) {
      if (mounted) {
        setState(() => showFlags[i] = true);
        await Future.delayed(const Duration(milliseconds: 150));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Technical Skills',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF143A52),
            ),
          ),
          const SizedBox(height: 32),
          // Languages Section
          if (showLanguagesSection) ...[
            _buildSubsection(
              'Languages',
              widget.programmingLanguages,
              showLanguagesChips,
            ),
            const SizedBox(height: 24),
          ],

          // Frameworks Section
          if (showFrameworksSection) ...[
            _buildSubsection(
              'Frameworks',
              widget.frameworks,
              showFrameworksChips,
            ),
            const SizedBox(height: 24),
          ],

          // Version Control Section
          if (showVersionControlSection) ...[
            _buildSubsection(
              'Version Control',
              widget.versionControl,
              showVersionControlChips,
            ),
            const SizedBox(height: 24),
          ],

          // Data Processing & Big Data Section
          if (showDataProcessingSection) ...[
            _buildSubsection(
              'Data Processing & Big Data',
              widget.dataProcessing,
              showDataProcessingChips,
            ),
            const SizedBox(height: 24),
          ],

          // Container Orchestration Section
          if (showContainerOrchestrationSection) ...[
            _buildSubsection(
              'Container Orchestration Platforms',
              widget.containerOrchestration,
              showContainerOrchestrationChips,
            ),
            const SizedBox(height: 24),
          ],

          // Databases Section
          if (showDatabasesSection) ...[
            _buildSubsection(
              'Databases & Data Stores',
              widget.databases,
              showDatabasesChips,
            ),
            const SizedBox(height: 24),
          ],

          // CI/CD & DevOps Section
          if (showCicdDevOpsSection) ...[
            _buildSubsection(
              'CI/CD & DevOps Pipelines',
              widget.cicdDevOps,
              showCicdDevOpsChips,
            ),
            const SizedBox(height: 24),
          ],

          // Operating Systems Section
          if (showOperatingSystemsSection) ...[
            _buildSubsection(
              'Operating Systems',
              widget.operatingSystems,
              showOperatingSystemsChips,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSubsection(
    String title,
    List<Map<String, dynamic>> items,
    List<bool> showFlags,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF143A52),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: items.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> item = entry.value;
            return showFlags[index]
                ? ToolChip(tool: item)
                : const SizedBox.shrink();
          }).toList(),
        ),
      ],
    );
  }
}
