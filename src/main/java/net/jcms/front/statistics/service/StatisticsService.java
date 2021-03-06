package net.jcms.front.statistics.service;

import java.util.List;
import java.util.Map;

import net.jcms.framework.base.service.BaseService;
import net.jcms.front.statistics.model.Statistics;
import net.jcms.front.statistics.model.StatisticsSearch;

public interface StatisticsService extends BaseService<Statistics, StatisticsSearch> {

	List<Map<String, Object>> selectRealTimeDataList(Map<String, Object> paramMap);

	List<Map<String, Object>> selectObsvname();

	List<Map<String, Object>> selectSensorNm(Map<String, Object> paramMap);

	List<Map<String, Object>> selectAvgList(Map<String, Object> paramMap);

	int selectAvgListCnt(Map<String, Object> paramMap);

	List<Map<String, Object>> selectGraphList(Map<String, Object> paramMap);

	List<Map<String, Object>> selectUpdateList(Map<String, Object> paramMap);

	void deleteList(Map<String, Object> paramMap);

	void updateList(Map<String, Object> paramMap);

	void resetList(Map<String, Object> paramMap);

	List<Map<String, Object>> changeYnList(Map<String, Object> paramMap);

	void groupDeleteList(Map<String, Object> paramMap);

	void groupResetList(Map<String, Object> paramMap);

	void groupUpdateList(Map<String, Object> paramMap);

	List<Map<String, Object>> selectMapChartGwDataList(Map<String, Object> paramMap);

	Map<String, Object> selectMapChartGwDataMaxMin(Map<String, Object> paramMap);

	Map selectSeqSiteData(Map<String, Object> paramMap);

	Map<String, Object> selectSituationDataGrp(Map<String, Object> paramMap);

	Map<String, Object> selectPumpUseData(Map<String, Object> paramMap);
}
