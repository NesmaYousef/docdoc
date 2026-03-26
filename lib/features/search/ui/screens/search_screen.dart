import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../home/logic/cubit/home_cubit.dart';
import '../../../home/logic/cubit/home_state.dart';
import '../../../home/data/models/specializations_response_model.dart';
import '../../../home/ui/widgets/doctors_list/doctors_list_view_item.dart';
import '../widgets/search_sort_bottom_sheet.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  List<String> _recentSearches = [];
  String _selectedCategory = 'All';

  final List<String> _sortOptions = ['Name (A - Z)', 'Name (Z - A)'];
  String _selectedSort = 'Name (A - Z)';

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getSpecializations();
    _loadRecentSearches();
    _searchController.addListener(() {
      setState(() {
        _isSearching = _searchController.text.isNotEmpty;
      });
    });
  }
  
  Future<void> _loadRecentSearches() async {
    final searches = Hive.box('recent_searches').get('searches', defaultValue: <String>[]);
    setState(() {
      _recentSearches = List<String>.from(searches);
    });
  }
  
  Future<void> _addRecentSearch(String query) async {
    if (query.trim().isEmpty) return;
    if (_recentSearches.contains(query)) {
      _recentSearches.remove(query);
    }
    _recentSearches.insert(0, query);
    if (_recentSearches.length > 10) {
      _recentSearches.removeLast();
    }
    await Hive.box('recent_searches').put('searches', _recentSearches);
    setState(() {});
  }

  Future<void> _removeRecentSearch(String query) async {
    _recentSearches.remove(query);
    await Hive.box('recent_searches').put('searches', _recentSearches);
    setState(() {});
  }
  
  Future<void> _clearRecentSearches() async {
    _recentSearches.clear();
    await Hive.box('recent_searches').put('searches', _recentSearches);
    setState(() {});
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<String> _getSpecialities(HomeCubit cubit) {
    final specs = cubit.specializationsList?.map((e) => e?.name ?? '').where((e) => e.isNotEmpty).toList() ?? [];
    return ['All', ...specs];
  }

  void _showSortByBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SearchSortByBottomSheet(
          sortOptions: _sortOptions,
          selectedSort: _selectedSort,
          onSortChanged: (val) {
            setState(() {
              _selectedSort = val;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Search'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final homeCubit = context.read<HomeCubit>();
              final specialities = _getSpecialities(homeCubit);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(16),
                  _buildSearchBar(specialities),
                  verticalSpace(24),
                  Expanded(
                    child: _isSearching ? _buildSearchResults(homeCubit, specialities) : _buildRecentSearches(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(List<String> specialities) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48.h,
            decoration: BoxDecoration(
              color: AppColors.primarySurface.withOpacity(0.3),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: TextField(
              controller: _searchController,
              textInputAction: TextInputAction.search,
              onSubmitted: (val) => _addRecentSearch(val),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyles.font14GrayRegular,
                prefixIcon: const Icon(Icons.search, color: AppColors.textGray),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
              ),
            ),
          ),
        ),
        horizontalSpace(16),
        InkWell(
          onTap: _showSortByBottomSheet,
          child: Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.strokeGray, width: 1),
            ),
            child: const Icon(Icons.filter_list, color: AppColors.textDark),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentSearches() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Search',
              style: TextStyles.font16BlackBold,
            ),
            TextButton(
              onPressed: _clearRecentSearches,
              child: Text(
                'Clear All History',
                style: TextStyles.font12GrayMedium.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
        verticalSpace(16),
        Expanded(
          child: _recentSearches.isEmpty
              ? Center(
                  child: Text('No recent searches', style: TextStyles.font14GrayRegular),
                )
              : ListView.separated(
                  itemCount: _recentSearches.length,
                  separatorBuilder: (context, index) => verticalSpace(16),
                  itemBuilder: (context, index) {
                    final query = _recentSearches[index];
                    return InkWell(
                      onTap: () {
                        _searchController.text = query;
                        _addRecentSearch(query);
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.access_time, color: AppColors.textGray, size: 20),
                          horizontalSpace(12),
                          Expanded(
                            child: Text(
                              query,
                              style: TextStyles.font14GrayRegular,
                            ),
                          ),
                          InkWell(
                            onTap: () => _removeRecentSearch(query),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(Icons.close, color: AppColors.textGray, size: 20),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildSearchResults(HomeCubit homeCubit, List<String> specialities) {
    // Collect all doctors
    List<Doctors> allDoctors = [];
    if (homeCubit.specializationsList != null) {
      for (var spec in homeCubit.specializationsList!) {
        if (spec?.doctorsList != null) {
          for (var doc in spec!.doctorsList!) {
            if (doc != null) {
              if (_selectedCategory == 'All' || spec.name == _selectedCategory) {
                final String query = _searchController.text.toLowerCase().trim();
                if (doc.name?.toLowerCase().contains(query) == true ||
                    spec.name?.toLowerCase().contains(query) == true) {
                  allDoctors.add(doc);
                }
              }
            }
          }
        }
      }
    }

    if (_selectedSort == 'Name (A - Z)') {
      allDoctors.sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));
    } else if (_selectedSort == 'Name (Z - A)') {
      allDoctors.sort((a, b) => (b.name ?? '').compareTo(a.name ?? ''));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: specialities.map((category) {
              final isSelected = _selectedCategory == category;
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.primarySurface.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      category,
                      style: TextStyles.font14GrayRegular.copyWith(
                        color: isSelected ? Colors.white : AppColors.textDark,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        verticalSpace(24),
        Text(
          '${allDoctors.length} founds',
          style: TextStyles.font16BlackBold,
        ),
        verticalSpace(16),
        Expanded(
          child: allDoctors.isEmpty
              ? Center(child: Text('No doctors found', style: TextStyles.font14GrayRegular))
              : ListView.builder(
                  itemCount: allDoctors.length,
                  itemBuilder: (context, index) {
                    return DoctorsListViewItem(
                      doctorsModel: allDoctors[index],
                    );
                  },
                ),
        ),
      ],
    );
  }
}
