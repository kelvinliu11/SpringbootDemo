package com.kelvin.controller;

import com.kelvin.domain.AssetAssign;
import com.kelvin.domain.PolAsset;
import com.kelvin.service.AssetAssignService;
import com.kelvin.service.AssetService;
import com.kelvin.vo.ResponseVo;
import com.kelvin.vo.asset.AssetQueryVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @Author: Kelvin
 * @Description:
 * @Date: 2017/7/2.21:13
 */
@Controller
public class AssetController {

    private static final Logger logger = LoggerFactory.getLogger(AssetController.class);

    @Autowired
    AssetService assetService;
    @Autowired
    AssetAssignService assignService;

    @RequestMapping("/asset/showAsset")
    public ModelAndView showAssets(AssetQueryVo assetVo) {
        List<PolAsset> allAssets = assetService.queryAllAssets(assetVo);
        ModelAndView mv = new ModelAndView("asset/AllAsset");
        mv.addObject("assets", allAssets);
        mv.addObject("asset", assetVo);
        return mv;
    }

    /**
     * 展示
     * 添加资产包页面
     */
    @RequestMapping("/asset/addAsset")
    public ModelAndView addAssetIndex() {
        return new ModelAndView("asset/addAsset");
    }

    /**
     * 执行
     * 添加资产包
     * @return
     */
    @RequestMapping("/asset/add/do")
    @ResponseBody
    public ResponseVo doAddAsset(PolAsset asset) {
        ResponseVo responseVo = new ResponseVo();
        try {
            assetService.addAsset(asset);
            responseVo.setSuccess(true);
            responseVo.setMsg("success");
            responseVo.setData("添加成功");
        } catch (Exception e) {
            logger.error("", e);
            responseVo.setSuccess(false);
            responseVo.setMsg("fail");
        }
        return responseVo;
    }

    @RequestMapping("/asset/modifyAsset")
    public ModelAndView modifyAsset(PolAsset asset) {
        PolAsset dbRecord = assetService.findById(asset.getId());
        ModelAndView mv = new ModelAndView("asset/modifyAsset");
        mv.addObject("asset", dbRecord);
        return mv;
    }
    /**
     * 执行
     * 添加资产包
     * @return
     */
    @RequestMapping("/asset/modify/do")
    @ResponseBody
    public ResponseVo doModifyAsset(PolAsset asset) {
        ResponseVo responseVo = new ResponseVo();
        try {
            assetService.modifyAsset(asset);
            responseVo.setSuccess(true);
            responseVo.setMsg("success");
            responseVo.setData("添加成功");
        } catch (Exception e) {
            logger.error("", e);
            responseVo.setSuccess(false);
            responseVo.setMsg("fail");
        }
        return responseVo;
    }

    /**
     * 展示资产分配index页面，用户展示分配及后续操作
     * @param asset
     * @return
     */
    @RequestMapping("/asset/assignAsset")
    public ModelAndView assignAsset(PolAsset asset) {
        // 获取资产包信息用于在头部展示
        asset = assetService.findById(asset.getId());
        // 获取资产包的分配信息用于展示明细
        List<AssetAssign> assetAssigns = assignService.findByAssetId(asset.getId());
        ModelAndView mv = new ModelAndView("asset/AssignAsset");
        mv.addObject("asset", asset);
        mv.addObject("assetAssigns", assetAssigns);
        return mv;
    }

    @RequestMapping("/asset/addAssetAssign")
    public ModelAndView addAssetAssign(Integer assetId) {
        ModelAndView mv = new ModelAndView("asset/addAssetAssign");
        mv.addObject("assetId", assetId);
        return mv;
    }

    @RequestMapping("/asset/addAssetAssign/do")
    @ResponseBody
    public ResponseVo doAddAssetAssgin(AssetAssign assign) {
        ResponseVo responseVo = new ResponseVo();
        try {
            assignService.save(assign);
            responseVo.setSuccess(true);
            responseVo.setMsg("success");
            responseVo.setData("添加成功");
        } catch (Exception e) {
            logger.error("", e);
            responseVo.setSuccess(false);
            responseVo.setMsg("fail");
        }
        return responseVo;
    }

    @RequestMapping("/asset/modifyAssetAssign")
    public ModelAndView modifyAssetAssign(Integer id) {
        AssetAssign assetAssign = assignService.findByAssignId(id);
        ModelAndView mv = new ModelAndView("asset/modifyAssetAssign");
        mv.addObject("assetAssign", assetAssign);
        return mv;
    }

    @RequestMapping("/asset/modifyAssetAssign/do")
    @ResponseBody
    public ResponseVo doModifyAssetAssgin(AssetAssign assign) {
        ResponseVo responseVo = new ResponseVo();
        try {
            assignService.modifyAssetAssign(assign);
            responseVo.setSuccess(true);
            responseVo.setMsg("success");
            responseVo.setData("更新成功");
        } catch (Exception e) {
            logger.error("", e);
            responseVo.setSuccess(false);
            responseVo.setMsg("fail");
        }
        return responseVo;
    }


    @RequestMapping("/asset/queryAll")
    @ResponseBody
    public List<PolAsset> queryAllAssets() {
        return null;
    }
}
