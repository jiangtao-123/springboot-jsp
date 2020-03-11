<%@ page import="com.dongtech.bs.entity.UserEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
    UserEntity userEntity = (UserEntity) request.getSession().getAttribute("userInfo");
    int evelopmentCount = (int) request.getAttribute("evelopmentCount");
    int fileCount = (int) request.getAttribute("fileCount");
    int partyToal = evelopmentCount + fileCount;
    int branchCount = (int) request.getAttribute("branchList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>控制台</title>
    <link rel="stylesheet" href="/assets/libs/layui/css/layui.css"/>
    <link rel="stylesheet" href="/assets/module/admin.css?v=316"/>
    <script src="/assets/libs/jquery/jquery-3.2.1.min.js"></script>
    <script src="/assets/libs/IE9/html5shiv.min.js"></script>
    <script src="/assets/libs/IE9/respond.min.js"></script>
    <style>
        /** 统计快捷方式样式 */
        .console-link-block {
            font-size: 16px;
            padding: 25px 20px;
            border-radius: 4px;
            background-color: #9BC539;
            color: rgba(255, 255, 255, .8);
            box-shadow: 0 2px 3px rgba(0, 0, 0, .05);
            position: relative;
            overflow: hidden;

            text-indent: 30px;

            height: 65px;
        }

        .console-link-block .console-link-block-text {
            font-size: 22px;

            margin-bottom: 15px;
            color: #fff;
        }

        .console-link-block .console-link-block-num {
            font-size: 30px;
            color: #fff;
            font-weight: bold;
            margin-top: 20px;
        }

        .console-link-block .console-link-block-icon {
            position: absolute;
            top: 50%;
            right: 20px;
            width: 50px;
            height: 50px;
            font-size: 50px;
            line-height: 50px;
            margin-top: -25px;
            color: rgba(255, 255, 255, .65);
        }

        .console-link-block .console-link-block-band {
            width: 80px;
            line-height: 1;
            padding: 4px 0;
            font-size: 12px;
            text-align: center;
            background-color: #E32A16;
            color: rgba(255, 255, 255, .8);
            position: absolute;
            top: 8px;
            right: -20px;
            transform: rotate(45deg);
            transform-origin: center;
            z-index: 1;
        }

        /** //统计快捷方式样式 */

        /** 设置每个快捷块的颜色 */

        .layui-row > div:nth-child(5) .console-link-block {
            background-color: rgb(254, 170, 79);
        }

        .layui-row > div:last-child .console-link-block {
            background-color: rgb(64, 212, 176);
        }

    </style>
</head>
<body>
<!-- 正文开始 -->
<div class="layui-fluid ew-console-wrapper">
    <!-- 快捷方式 -->
    <div class="layui-card">
        <div class="layui-card-header">今日数据</div>
        <div class="layui-card-body">
            <div class="layui-row layui-col-space25">
                <div class="layui-col-sm3 layui-col-xs6">
                    <div class="console-link-block" ew-href="main/evelopment"
                         ew-title="发展中党员">
                        <div class="console-link-block-text">发展党员数</div>
                        <div class="console-link-block-num"><%=evelopmentCount%>
                        </div>
                        <!--<i class="console-link-block-icon layui-icon layui-icon-survey"></i>-->
                        <!--<div class="console-link-block-band">待审批</div>-->
                    </div>
                </div>
                <div class="layui-col-sm3 layui-col-xs6">
                    <div class="console-link-block" ew-href="main/tobranch" ew-title="党支部">
                        <div class="console-link-block-text">党支部数</div>
                        <div class="console-link-block-num"><%=branchCount%>
                        </div>
                        <!--<i class="console-link-block-icon layui-icon layui-icon-print"></i>-->
                        <!--<div class="console-link-block-band">待审批</div>-->
                    </div>
                </div>
                <div class="layui-col-sm3 layui-col-xs6">
                    <div class="console-link-block" ew-href="main/partyToal"
                         ew-title="累计党员数">
                        <div class="console-link-block-text">累计党员数</div>
                        <div class="console-link-block-num"><%=partyToal%>
                        </div>
                        <!--<i class="console-link-block-icon layui-icon layui-icon-list"-->
                        <!--style="font-size: 62px;padding-right: 5px;"></i>-->
                        <!--<div class="console-link-block-band">去查看</div>-->
                    </div>
                </div>
                <div class="layui-col-sm3 layui-col-xs6">
                    <div class="console-link-block" ew-href="main/file"
                         ew-title="归档党员">
                        <div class="console-link-block-text">归档数</div>
                        <div class="console-link-block-num"><%=fileCount%>
                        </div>
                        <!--<i class="console-link-block-icon layui-icon layui-icon-date"></i>-->
                        <!--<div class="console-link-block-band">去查看</div>-->
                    </div>
                </div>
                <!--<div class="layui-col-lg2 layui-col-sm4 layui-col-xs6">
                    <div class="console-link-block" ew-href="page/plugin/basic/dialog.html" ew-title="拜访记录">
                        <div class="console-link-block-num">11</div>
                        <div class="console-link-block-text">拜访记录</div>
                        <i class="console-link-block-icon layui-icon layui-icon-service"></i>
                        <div class="console-link-block-band">去查看</div>
                    </div>
                </div>
                <div class="layui-col-lg2 layui-col-sm4 layui-col-xs6">
                    <div class="console-link-block" ew-href="page/plugin/basic/notice.html" ew-title="项目申报">
                        <div class="console-link-block-num">26</div>
                        <div class="console-link-block-text">项目申报</div>
                        <i class="console-link-block-icon layui-icon layui-icon-chart-screen"></i>
                        <div class="console-link-block-band">待审批</div>
                    </div>
                </div>-->
            </div>
        </div>
    </div>

    <!-- 统计图表 -->
    <div class="layui-row layui-col-space15">
        <div class="layui-col-sm6 layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">发展党员历年人数趋势</div>
                <div class="layui-card-body">
                    <div id="tjDivMonth" style="height: 330px;"></div>
                </div>
            </div>
        </div>

        <div class="layui-col-sm6 layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">各阶段发展党员一览</div>
                <div class="layui-card-body">
                    <div id="tjDivWeek" style="height: 330px;"></div>
                </div>
            </div>
        </div>

        <div class="layui-col-sm6 layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">发展党员支部人数</div>
                <div class="layui-card-body">
                    <div id="zhibu" style="height: 330px;"></div>
                </div>
            </div>
        </div>

        <div class="layui-col-sm6 layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">发展党员概况</div>
                <div class="layui-card-body">
                    <div id="tjDivDay" style="height: 330px;"></div>
                </div>
            </div>
        </div>


    </div>
</div>

<!-- 加载动画 -->
<div class="page-loading">
    <div class="ball-loader">
        <span></span><span></span><span></span><span></span>
    </div>
</div>
<!-- js部分 -->
<script type="text/javascript" src="/assets/libs/layui/layui.js"></script>
<script type="text/javascript" src="/assets/js/common.js?v=316"></script>
<script src="/assets/libs/echarts/echarts.min.js"></script>
<script>
  layui.use(['layer',], function () {
    var $ = layui.jquery;
    var layer = layui.layer;
    //动态获取图表数据；
    var myCharts1;
    var myCharts2;
    var myCharts3;
    var myCharts4;
    var myCharts3Data;
    var myCharts3Year;
    var myCharts2Data;
    var myCharts2Stage;
    var myCharts1Area;
    var myCharts1Age;
    var myCharts4Data = ['一支部', '二支部', '三支部', '四支部', '五支部', '六支部', '七支部',];
    var myCharts4Num = [15, 14, 13, 13, 13, 14, 15,];
    // = [15, 14, 13, 13, 13, 14, 15,]
    $.post("/statistics/getData", {}, function (data) {
      myCharts3Data = data.myCharts3Data;
      myCharts3Year = data.myCharts3Year;
      myCharts2Data = data.myCharts2Data;
      myCharts2Stage = data.myCharts2Stage;
      myCharts1Area = data.myCharts1Area;
      myCharts1Age = data.myCharts1Age;
      myCharts4Data = data.myCharts4Data;
      myCharts4Num = data.myCharts4Num;
      myCharts4 = echarts.init(document.getElementById('zhibu'));
      var options4 = {
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            lineStyle: {
              color: '#ffc645', //HOVER Y轴颜色
              width: 2,
            }
          },

        },
        // color: ['#ff7aeb'], //折线颜色

        legend: {
          show: false,
          orient: 'vertical',
          right: '0px',
          top: '0px',
          // data: ['已签到', '未签到'],
          textStyle: {
            color: '#595959'
          }
        },
        grid: {  // 设置距离边界的位置
          top: '35px',
          left: '55px',
          right: '55px',
          bottom: '20px'
        },
        xAxis: {
          name: '年份',
          nameTextStyle: {
            color: '#595959'
          },

          type: 'category',
          data: myCharts4Data,
          axisLine: {
            lineStyle: {
              color: '#d3dbff', //X轴颜色
              width: 2,
            },
            symbol: ['none', 'arrow'],
            symbolOffset: [0, 10]
          },

          axisLabel: {
            color: '#666',
            // interval: function (index, value) {
            //     if (index == 0 || ((index + 1) % 5 == 0)) {
            //         return true;
            //     }
            //     return false;
            // }
          },
          axisTick: {
            alignWithLabel: true
          }
        },
        yAxis: {
          name: '人数',
          nameTextStyle: {
            color: '#595959'
          },
          type: 'value',
          boundaryGap: ['0', '20%'],
          axisTick: {
            show: false
          },
          axisLine: {
            lineStyle: {
              color: '#d3dbff', //Y轴颜色
              width: 2,
            },
            symbol: ['none', 'arrow'],
            symbolOffset: [0, 10]
          },
          axisLabel: {
            color: '#666'
          },
          splitLine: {
            show: true,
            lineStyle: {
              color: '#d3dbff', //Y轴颜色
              width: 2,
            },
          },
          splitArea: {
            show: false
          },
          minInterval: 1
        },
        series: [
          {
            name: '发展党员',
            type: 'line',
            smooth: false,

            itemStyle: {
              normal: {
                color: '#ffb421', //折点颜色
                width: 4,
                lineStyle: {
                  color: '#ffc645', //折线颜色
                  width: 2
                }
              }
            },
            data: myCharts4Num
          },
        ]
      };
      myCharts4.setOption(options4);

      // ------------------------------------------------------------------------

      // 渲染发展党员概况
      var dyArea = myCharts1Area;

      var dyAge = myCharts1Age;
      var colors = ["#ffbf42", "#1ee285", "#758fff", "#49d1ff",];

      // 颜色下标，每次渲染饼图一个扇区加一操作
      var i = 0, i2 = 0;

      myCharts1 = echarts.init(document.getElementById('tjDivDay'));

      var option1 = {
        tooltip: {},
        title: [{
          text: '发展党员基本情况',
          subtext: '总计 ' + Object.keys(dyArea).reduce(function (all, key) {
            return all + dyArea[key];
          }, 0),
          left: '25%',
          top: '75%',
          textAlign: 'center',
          textStyle: {
            fontSize: 16,
            fontWeight: 'normal'
          },
          subtextStyle: {
            fontSize: 14,
          }

        }, {
          text: '发展党员年龄结构',
          subtext: '总计 ' + Object.keys(dyAge).reduce(function (all, key) {
            return all + dyAge[key];
          }, 0),
          left: '75%',
          top: '75%',
          textAlign: 'center',
          textStyle: {
            fontSize: 16,
            fontWeight: 'normal'
          },
          subtextStyle: {
            fontSize: 14,
          }
        }],

        series: [{
          type: 'pie',
          radius: ['30%', '45%'],  //饼图大小
          center: ['25%', '35%'],
          data: Object.keys(dyArea).map(function (key) {
            return {
              name: key,
              value: dyArea[key]
            }
          }),
          label: {
            formatter: '{b}: {c} \n {d}%',
            fontSize: 14,
          },
          itemStyle: {
            normal: {
              // 设置饼图的颜色
              color: function () {
                return colors[i2++];
              }
            },
          }
        }, {
          type: 'pie',
          radius: ['30%', '45%'],  //饼图大小
          center: ['75%', '35%'],
          data: Object.keys(dyAge).map(function (key) {
            return {
              name: key,
              value: dyAge[key]
            };
          }),
          label: {
            formatter: '{b}: {c} \n {d}%',
            fontSize: 14,
          },
          itemStyle: {
            normal: {
              // 设置饼图的颜色
              color: function () {
                return colors[i++];
              }
            },
          }
        }]
      };
      if (option1 && typeof option1 === "object") {
        myCharts1.setOption(option1, true);
      }

      // ------------------------------------------------------------------------
      // 各阶段发展党员一览
      myCharts2 = echarts.init(document.getElementById('tjDivWeek'));
      var options2 = {
        tooltip: {
          trigger: 'axis', // 是否显示 指示线
          axisPointer: {
            lineStyle: {
              color: '#d3dbff', //HOVER Y轴颜色
              width: 2,
            }
          }
        },
        color: ['#44c7ff'],
        legend: {
          orient: 'vertical',
          right: '0px',
          top: '0px',
          data: ['人数'],
          textStyle: {
            color: '#595959'
          }
        },
        grid: { // 设置距离边界的位置
          top: '35px',
          left: '55px',
          right: '55px',
          bottom: '20px'
        },
        xAxis: {
          name: '阶段',
          nameTextStyle: {
            color: '#666'
          },
          type: 'category',
          data: myCharts2Stage,// ['第一阶段', '第二阶段', '第三阶段', '第四阶段', '第五阶段'],
          axisLine: {
            lineStyle: {
              color: '#d3dbff', //Y轴颜色
              width: 2,
            },
            symbol: ['none', 'arrow'],
            symbolOffset: [0, 10]
          },
          axisLabel: {
            color: '#666',  //横向文字颜色
          },
          axisTick: {
            alignWithLabel: true
          }
        },
        yAxis: {
          name: '人数',
          nameTextStyle: {
            color: '#666'
          },
          type: 'value',
          boundaryGap: ['0', '20%'],
          axisTick: {
            show: false
          },
          axisLine: {
            lineStyle: {
              color: '#d3dbff', //X轴颜色
              width: 2,
            },
            symbol: ['none', 'arrow'],
            symbolOffset: [0, 10]
          },
          axisLabel: {
            color: '#8c8c8c'
          },
          splitLine: {
            show: true,
            lineStyle: {
              color: '#d3dbff', //Y轴颜色
              width: 2,
            },
          },
          splitArea: {
            show: false
          },
          minInterval: 1
        },
        series: [
          {
            name: '发展党员',
            type: 'bar',
            stack: 'one',
            barMaxWidth: '24px', //柱状图每条宽度
            label: {
              normal: {
                show: true,
                position: 'inside'
              }
            },
            itemStyle: {
              emphasis: {
                // barBorderRadius: 7
              },
              // normal: {
              //     barBorderRadius: 7
              // }

              normal: {
                barBorderRadius: [20, 20, 0, 0],

                color: function (params) {
                  var colorList = [
                    ['#ffb43f', '#ffe34f'],
                    ['#5fff5b', '#41ff81'],
                    ['#3fbcff', '#4edcff'],
                    ['#486aff', '#839aff'],
                    ['#ff66f4', '#ff88d6']
                  ];

                  var index = params.dataIndex % colorList.length;
                  // 如果是纵向的图标，则改为0, 0 , 0, 1
                  return new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                    {offset: 0, color: colorList[index][0]},
                    {offset: 1, color: colorList[index][1]}
                  ]);
                },
              },
            },

          },

          // {
          //     name: '未签到',
          //     type: 'bar',
          //     stack: 'one',
          //     barMaxWidth: '30px',
          //     label: {
          //         normal: {
          //             show: true,
          //             position: 'inside'
          //         }
          //     }
          // }
        ]
      };
      myCharts2.setOption(options2);
      // 赋值
      myCharts2.setOption({
        series: [{data: myCharts2Data}]
      });

      // -------------------------------------------------------------------------
      // 发展党员历年人数趋势
      myCharts3 = echarts.init(document.getElementById('tjDivMonth'));
      var options3 = {
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            lineStyle: {
              color: '#d3dbff', //HOVER Y轴颜色
              width: 2,
            }
          },

        },
        // color: ['#ff7aeb'], //折线颜色

        legend: {
          show: false,
          orient: 'vertical',
          right: '0px',
          top: '0px',
          // data: ['已签到', '未签到'],
          textStyle: {
            color: '#595959'
          }
        },
        grid: {  // 设置距离边界的位置
          top: '35px',
          left: '55px',
          right: '55px',
          bottom: '20px'
        },
        xAxis: {
          name: '年份',
          nameTextStyle: {
            color: '#595959'
          },

          type: 'category',
          data: myCharts3Year,//['2013年', '2014年', '2015年', '2016年', '2017年', '2018年', '2019年'],
          axisLine: {
            lineStyle: {
              color: '#d3dbff', //X轴颜色
              width: 2,
            },
            symbol: ['none', 'arrow'],
            symbolOffset: [0, 10]
          },

          axisLabel: {
            color: '#666',
            // interval: function (index, value) {
            //     if (index == 0 || ((index + 1) % 5 == 0)) {
            //         return true;
            //     }
            //     return false;
            // }
          },
          axisTick: {
            alignWithLabel: true
          }
        },
        yAxis: {
          name: '人数',
          nameTextStyle: {
            color: '#595959'
          },
          type: 'value',
          boundaryGap: ['0', '20%'],
          axisTick: {
            show: false
          },
          axisLine: {
            lineStyle: {
              color: '#d3dbff', //Y轴颜色
              width: 2,
            },
            symbol: ['none', 'arrow'],
            symbolOffset: [0, 10]
          },
          axisLabel: {
            color: '#666'
          },
          splitLine: {
            show: true,
            lineStyle: {
              color: '#d3dbff', //Y轴颜色
              width: 2,
            },
          },
          splitArea: {
            show: false
          },
          minInterval: 1
        },
        series: [
          {
            name: '发展党员',
            type: 'line',
            smooth: false,

            itemStyle: {
              normal: {
                color: '#ffb421', //折点颜色
                width: 4,
                lineStyle: {
                  color: '#ff7aeb', //折线颜色
                  width: 2
                }
              }
            },
            data: myCharts3Data,//[15, 14, 13, 13, 13, 14, 15,]
          },
        ]
      };
      myCharts3.setOption(options3);

      // -------------------------------------------------------------------------
    });

    // 窗口大小改变事件
    window.onresize = function () {
      myCharts1.resize();
      myCharts2.resize();
      myCharts3.resize();
      myCharts4.resize();
    };

  });
</script>
</body>

</html>