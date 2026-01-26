<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE AdapterType SYSTEM "../LibraryElement.dtd">
<AdapterType GUID="a03ed6c2-7f82-4856-989d-89dab6d00f58" Name="ICouleur" Comment="Adapter Interface" Namespace="Main">
  <Identification Standard="61499-1" />
  <VersionInfo Organization="Schneider Electric" Version="0.0" Author=" " Date="07/01/2026" />
  <InterfaceList>
    <EventInputs>
      <Event Name="NEW_COLOR" Comment="Request from Socket">
        <With Var="Couleur" />
        <With Var="Changement" />
      </Event>
    </EventInputs>
    <InputVars>
      <VarDeclaration Name="Couleur" Type="INT" Comment="0=Aucune, 1=Bleu, 2=Vert, 3=Gris" />
      <VarDeclaration Name="Changement" Type="BOOL" Comment="TRUE si couleur différente" />
    </InputVars>
  </InterfaceList>
  <Service RightInterface="PLUG" LeftInterface="SOCKET">
    <ServiceSequence Name="request_confirm">
      <ServiceTransaction>
        <InputPrimitive Interface="SOCKET" Event="NEW_COLOR" Parameters="REQD" />
        <OutputPrimitive Interface="PLUG" Event="NEW_COLOR" Parameters="REQD" />
      </ServiceTransaction>
      <ServiceTransaction>
        <InputPrimitive Interface="PLUG" Event="CNF" Parameters="CNFD" />
        <OutputPrimitive Interface="SOCKET" Event="CNF" Parameters="CNFD" />
      </ServiceTransaction>
    </ServiceSequence>
    <ServiceSequence Name="indication_response">
      <ServiceTransaction>
        <InputPrimitive Interface="PLUG" Event="IND" Parameters="INDD" />
        <OutputPrimitive Interface="SOCKET" Event="IND" Parameters="INDD" />
      </ServiceTransaction>
      <ServiceTransaction>
        <InputPrimitive Interface="SOCKET" Event="RSP" Parameters="RSPD" />
        <OutputPrimitive Interface="PLUG" Event="RSP" Parameters="RSPD" />
      </ServiceTransaction>
    </ServiceSequence>
  </Service>
</AdapterType>