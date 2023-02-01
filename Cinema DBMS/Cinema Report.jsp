<%@ taglib uri="/WEB-INF/lib/reports_tld.jar" prefix="rw" %> 
<%@ page language="java" import="java.io.*" errorPage="/rwerror.jsp" session="false" %>
<%@ page contentType="text/html;charset=ISO-8859-1" %>
<!--
<rw:report id="report"> 
<rw:objects id="objects">
<?xml version="1.0" encoding="WINDOWS-1252" ?>
<report name="Cinema Report" DTDVersion="9.0.2.0.10">
  <xmlSettings xmlTag="MODULE2" xmlPrologType="text">
  <![CDATA[<?xml version="1.0" encoding="&Encoding"?>]]>
  </xmlSettings>
  <reportHtmlEscapes>
    <beforePageHtmlEscape>
    <![CDATA[#NULL#]]>
    </beforePageHtmlEscape>
  </reportHtmlEscapes>
  <data>
    <userParameter name="Hall_Parameter" datatype="number" precision="10"
     defaultWidth="0" defaultHeight="0">
      <listOfValues restrictToList="yes">
        <selectStatement hideFirstColumn="no">
        <![CDATA[SELECT ALL HALL.HALL_ID
FROM HALL ]]>
        </selectStatement>
      </listOfValues>
    </userParameter>
    <dataSource name="Q_1">
      <select>
      <![CDATA[SELECT ALL TICKET.TICKET_ID, TICKET.PRICE, TICKET.MNAME, TICKET.HALL_ID
FROM TICKET 
WHERE TICKET.HALL_ID =: HALL_PARAMETER]]>
      </select>
      <displayInfo x="1.65002" y="1.00000" width="0.69995" height="0.19995"/>
      <group name="G_HALL_ID">
        <displayInfo x="1.01111" y="1.94995" width="1.97791" height="0.61963"
        />
        <dataItem name="HALL_ID" oracleDatatype="number" columnOrder="14"
         width="22" defaultWidth="50000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Hall ID">
          <dataDescriptor expression="TICKET.HALL_ID"
           descriptiveExpression="HALL_ID" order="4" oracleDatatype="number"
           width="22" precision="10"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <summary name="SumPRICEPerHALL_ID" source="PRICE" function="sum"
         width="22" precision="10" reset="G_HALL_ID" compute="report"
         defaultWidth="50000" defaultHeight="10000" columnFlags="520"
         defaultLabel="TotalPerHall:">
          <displayInfo x="0.00000" y="0.00000" width="0.00000"
           height="0.00000"/>
        </summary>
      </group>
      <group name="G_TICKET_ID">
        <displayInfo x="1.34070" y="3.31958" width="1.31873" height="0.79956"
        />
        <dataItem name="TICKET_ID" oracleDatatype="number" columnOrder="11"
         width="22" defaultWidth="120000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Ticket ID">
          <dataDescriptor expression="TICKET.TICKET_ID"
           descriptiveExpression="TICKET_ID" order="1" oracleDatatype="number"
           width="22" precision="10"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="PRICE" oracleDatatype="number" columnOrder="12"
         width="22" defaultWidth="50000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Price">
          <dataDescriptor expression="TICKET.PRICE"
           descriptiveExpression="PRICE" order="2" oracleDatatype="number"
           width="22" precision="10"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="MNAME" datatype="vchar2" columnOrder="13" width="25"
         defaultWidth="120000" defaultHeight="10000" columnFlags="33"
         defaultLabel="Movie Name">
          <dataDescriptor expression="TICKET.MNAME"
           descriptiveExpression="MNAME" order="3" width="25"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
      </group>
    </dataSource>
    <summary name="SumPRICEPerReport" source="PRICE" function="sum" width="22"
     precision="10" reset="report" compute="report" defaultWidth="50000"
     defaultHeight="10000" columnFlags="552" defaultLabel="TotalOfAllHalls:">
      <displayInfo x="0.00000" y="0.00000" width="0.00000" height="0.00000"/>
    </summary>
  </data>
  <layout>
  <section name="main">
    <body>
      <frame name="M_G_HALL_ID_GRPFR">
        <geometryInfo x="0.00000" y="0.00000" width="2.81250" height="0.93750"
        />
        <generalLayout verticalElasticity="variable"/>
        <repeatingFrame name="R_G_HALL_ID" source="G_HALL_ID"
         printDirection="down" minWidowRecords="1" columnMode="no">
          <geometryInfo x="0.00000" y="0.00000" width="2.81250"
           height="0.75000"/>
          <generalLayout verticalElasticity="variable"/>
          <field name="F_HALL_ID" source="HALL_ID" minWidowLines="1"
           spacing="0" alignment="start">
            <font face="Courier New" size="10"/>
            <geometryInfo x="0.62500" y="0.00000" width="0.43750"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="yellow"/>
          </field>
          <frame name="M_G_TICKET_ID_GRPFR">
            <geometryInfo x="0.00000" y="0.18750" width="2.81250"
             height="0.56250"/>
            <generalLayout verticalElasticity="variable"/>
            <repeatingFrame name="R_G_TICKET_ID" source="G_TICKET_ID"
             printDirection="down" minWidowRecords="1" columnMode="no">
              <geometryInfo x="0.00000" y="0.37500" width="2.81250"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
              <field name="F_TICKET_ID" source="TICKET_ID" minWidowLines="1"
               spacing="0" alignment="start">
                <font face="Courier New" size="10"/>
                <geometryInfo x="0.00000" y="0.37500" width="1.06250"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
                <visualSettings fillPattern="transparent"
                 fillBackgroundColor="r100g100b50"/>
              </field>
              <field name="F_PRICE" source="PRICE" minWidowLines="1"
               spacing="0" alignment="start">
                <font face="Courier New" size="10"/>
                <geometryInfo x="1.18750" y="0.37500" width="0.43750"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
                <visualSettings fillPattern="transparent"
                 fillBackgroundColor="r100g100b50"/>
              </field>
              <field name="F_MNAME" source="MNAME" minWidowLines="1"
               spacing="0" alignment="start">
                <font face="Courier New" size="10"/>
                <geometryInfo x="1.75000" y="0.37500" width="1.06250"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
                <visualSettings fillPattern="transparent"
                 fillBackgroundColor="r100g100b50"/>
              </field>
            </repeatingFrame>
            <frame name="M_G_TICKET_ID_FTR">
              <geometryInfo x="0.00000" y="0.56250" width="2.56250"
               height="0.18750"/>
              <advancedLayout printObjectOnPage="lastPage"
               basePrintingOn="anchoringObject"/>
              <field name="F_SumPRICEPerHALL_ID" source="SumPRICEPerHALL_ID"
               minWidowLines="1" spacing="0" alignment="start">
                <font face="Courier New" size="10"/>
                <geometryInfo x="1.18750" y="0.56250" width="0.43750"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
                <visualSettings fillPattern="transparent"
                 fillBackgroundColor="r100g100b75"/>
              </field>
              <text name="B_Total_" minWidowLines="1">
                <textSettings spacing="0"/>
                <geometryInfo x="0.00000" y="0.56250" width="1.12500"
                 height="0.18750"/>
                <visualSettings fillPattern="transparent"
                 fillBackgroundColor="r100g100b75"/>
                <textSegment>
                  <font face="Courier New" size="10"/>
                  <string>
                  <![CDATA[TotalPerHall:]]>
                  </string>
                </textSegment>
              </text>
            </frame>
            <frame name="M_G_TICKET_ID_HDR">
              <geometryInfo x="0.00000" y="0.18750" width="2.81250"
               height="0.18750"/>
              <advancedLayout printObjectOnPage="allPage"
               basePrintingOn="enclosingObject"/>
              <text name="B_TICKET_ID" minWidowLines="1">
                <textSettings spacing="0"/>
                <geometryInfo x="0.00000" y="0.18750" width="1.06250"
                 height="0.18750"/>
                <visualSettings fillPattern="transparent"
                 fillBackgroundColor="yellow"/>
                <textSegment>
                  <font face="Courier New" size="10"/>
                  <string>
                  <![CDATA[Ticket ID]]>
                  </string>
                </textSegment>
              </text>
              <text name="B_PRICE" minWidowLines="1">
                <textSettings spacing="0"/>
                <geometryInfo x="1.18750" y="0.18750" width="0.43750"
                 height="0.18750"/>
                <visualSettings fillPattern="transparent"
                 fillBackgroundColor="yellow"/>
                <textSegment>
                  <font face="Courier New" size="10"/>
                  <string>
                  <![CDATA[Price]]>
                  </string>
                </textSegment>
              </text>
              <text name="B_MNAME" minWidowLines="1">
                <textSettings spacing="0"/>
                <geometryInfo x="1.75000" y="0.18750" width="1.06250"
                 height="0.18750"/>
                <visualSettings fillPattern="transparent"
                 fillBackgroundColor="yellow"/>
                <textSegment>
                  <font face="Courier New" size="10"/>
                  <string>
                  <![CDATA[Movie Name]]>
                  </string>
                </textSegment>
              </text>
            </frame>
          </frame>
          <text name="B_HALL_ID" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.00000" y="0.00000" width="0.62500"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r100g75b0"/>
            <textSegment>
              <font face="Courier New" size="10"/>
              <string>
              <![CDATA[Hall ID]]>
              </string>
            </textSegment>
          </text>
        </repeatingFrame>
        <frame name="M_G_HALL_ID_FTR">
          <geometryInfo x="0.00000" y="0.75000" width="2.56250"
           height="0.18750"/>
          <advancedLayout printObjectOnPage="lastPage"
           basePrintingOn="anchoringObject"/>
          <field name="F_SumPRICEPerReport" source="SumPRICEPerReport"
           minWidowLines="1" spacing="0" alignment="start">
            <font face="Courier New" size="10"/>
            <geometryInfo x="1.37500" y="0.75000" width="0.43750"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="yellow"/>
          </field>
          <text name="B_SumPRICEPerReport" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.00000" y="0.75000" width="1.37500"
             height="0.18750"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r100g75b0"/>
            <textSegment>
              <font face="Courier New" size="10"/>
              <string>
              <![CDATA[TotalOfAllHalls:]]>
              </string>
            </textSegment>
          </text>
        </frame>
      </frame>
    </body>
    <margin>
      <text name="B_OR$BODY_SECTION" minWidowLines="1">
        <textSettings justify="center" spacing="0"/>
        <geometryInfo x="3.75000" y="0.25000" width="1.68750" height="0.25000"
        />
        <visualSettings fillPattern="transparent"
         fillBackgroundColor="r100g88b0"/>
        <textSegment>
          <font face="Courier New" size="14"/>
          <string>
          <![CDATA[Tickets Report]]>
          </string>
        </textSegment>
      </text>
    </margin>
  </section>
  </layout>
  <reportPrivate defaultReportType="masterDetail" versionFlags2="0"
   templateName="" sectionTitle="Tickets Report"/>
  <reportWebSettings>
  <![CDATA[#NULL#]]>
  </reportWebSettings>
</report>
</rw:objects>
-->

<html>

<head>
<meta name="GENERATOR" content="Oracle 11gR1 Reports Developer"/>
<title> Your Title </title>



</head>


<body>

<!-- Data Area Generated by Reports Developer -->
<rw:dataArea id="MGHALLIDGRPFR11">
<rw:foreach id="RGHALLID111" src="G_HALL_ID">
<!-- Start GetGroupHeader/n --> <table>
 <caption> Tickets Report <br>Hall ID <rw:field id="F_HALL_ID" src="HALL_ID" breakLevel="RGHALLID111" breakValue="&nbsp;"> F_HALL_ID </rw:field><br>
 </caption>
<!-- End GetGroupHeader/n -->   <tr>
    <td valign="top">
    <table summary="Tickets Report">
     <!-- Header -->
     <thead>
      <tr>
       <th <rw:id id="HBTICKETID11" asArray="no"/>> Ticket ID </th>
       <th <rw:id id="HBPRICE11" asArray="no"/>> Price </th>
       <th <rw:id id="HBMNAME11" asArray="no"/>> Movie Name </th>
      </tr>
     </thead>
     <!-- Body -->
     <tbody>
      <rw:foreach id="RGTICKETID111" src="G_TICKET_ID">
       <tr>
        <td <rw:headers id="HFTICKETID11" src="HBTICKETID11"/>><rw:field id="FTICKETID11" src="TICKET_ID" nullValue="&nbsp;"> F_TICKET_ID </rw:field></td>
        <td <rw:headers id="HFPRICE11" src="HBPRICE11"/>><rw:field id="FPRICE11" src="PRICE" nullValue="&nbsp;"> F_PRICE </rw:field></td>
        <td <rw:headers id="HFMNAME11" src="HBMNAME11"/>><rw:field id="FMNAME11" src="MNAME" nullValue="&nbsp;"> F_MNAME </rw:field></td>
       </tr>
      </rw:foreach>
     </tbody>
     <tr>
      <th> &nbsp; </th>
      <th> &nbsp; </th>
      <td <rw:headers id="HFSumPRICEPerHALLID11" src="HBPRICE11"/>>TotalPerHall: <rw:field id="FSumPRICEPerHALLID11" src="SumPRICEPerHALL_ID" nullValue="&nbsp;"> F_SumPRICEPerHALL_ID </rw:field></td>
      <th> &nbsp; </th>
     </tr>
     <tr>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</rw:foreach>
<table summary="Tickets Report">
 <tr>
  <th> TotalOfAllHalls: <rw:field id="F_SumPRICEPerReport" src="SumPRICEPerReport" nullValue="&nbsp;"> F_SumPRICEPerReport </rw:field></th>
 </tr>
</table>
</rw:dataArea> <!-- id="MGHALLIDGRPFR11" -->
<!-- End of Data Area Generated by Reports Developer -->




</body>
</html>

<!--
</rw:report> 
-->
