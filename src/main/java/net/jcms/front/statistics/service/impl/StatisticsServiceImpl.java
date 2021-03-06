package net.jcms.front.statistics.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.front.statistics.mapper.StatisticsMapper;
import net.jcms.front.statistics.model.Statistics;
import net.jcms.front.statistics.model.StatisticsSearch;
import net.jcms.front.statistics.service.StatisticsService;

@Service(value="statisticsService")
public class StatisticsServiceImpl extends BaseServiceImpl<Statistics, StatisticsSearch, StatisticsMapper> implements StatisticsService {

	@Override
	@Resource (name="statisticsMapper")
	protected void setMapper (StatisticsMapper mapper) {
		super.setMapper (mapper);
	}

	@Override
	public List<Map<String, Object>> selectRealTimeDataList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mapper.selectRealTimeDataList(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectObsvname() {
		return mapper.selectObsvname();
	}

	@Override
	public List<Map<String, Object>> selectSensorNm(Map<String, Object> paramMap) {
		return mapper.selectSensorNm(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectAvgList(Map<String, Object> paramMap) {
		return mapper.selectAvgList(paramMap);
	}

	@Override
	public int selectAvgListCnt(Map<String, Object> paramMap) {
		return mapper.selectAvgListCnt(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectGraphList(Map<String, Object> paramMap) {
		return mapper.selectGraphList(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectUpdateList(Map<String, Object> paramMap) {
		return mapper.selectUpdateList(paramMap);
	}

	@Override
	public void deleteList(Map<String, Object> paramMap) {
		mapper.deleteList(paramMap);
	}

	@Override
	public void updateList(Map<String, Object> paramMap) {
		mapper.updateList(paramMap);
	}

	@Override
	public void resetList(Map<String, Object> paramMap) {
		mapper.resetList(paramMap);
	}

	@Override
	public List<Map<String, Object>> changeYnList(Map<String, Object> paramMap) {
		return mapper.changeYnList(paramMap);
	}

	@Override
	public void groupDeleteList(Map<String, Object> paramMap) {
		mapper.groupDeleteList(paramMap);
	}

	@Override
	public void groupResetList(Map<String, Object> paramMap) {
		mapper.groupResetList(paramMap);
	}

	@Override
	public void groupUpdateList(Map<String, Object> paramMap) {
		mapper.groupUpdateList(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectMapChartGwDataList(Map<String, Object> paramMap) {
		return mapper.selectMapChartGwDataList(paramMap);
	}
	
	@Override
	public Map<String, Object> selectMapChartGwDataMaxMin(Map<String, Object> paramMap) {
		return mapper.selectMapChartGwDataMaxMin(paramMap);
	}
	
	@Override
	public Map<String, Object> selectSeqSiteData(Map<String, Object> paramMap) {
		return mapper.selectSeqSiteData(paramMap);
	}

	@Override
	public Map<String, Object> selectSituationDataGrp(Map<String, Object> paramMap) {
		return mapper.selectSituationDataGrp(paramMap);
	}
	
	@Override
	public Map<String, Object> selectPumpUseData(Map<String, Object> paramMap) {
		return mapper.selectPumpUseData(paramMap);
	}
}
