package net.jcms.front.statistics.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.framework.base.mapper.BaseMapper;
import net.jcms.front.statistics.model.Statistics;
import net.jcms.front.statistics.model.StatisticsSearch;

@Mapper (value="statisticsMapper")
public interface StatisticsMapper extends BaseMapper<Statistics, StatisticsSearch>{

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

	Map<String, Object> selectSeqSiteData(Map<String, Object> paramMap);

	Map<String, Object> selectSituationDataGrp(Map<String, Object> paramMap);

	Map<String, Object> selectPumpUseData(Map<String, Object> paramMap);
}
