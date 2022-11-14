import 'package:flutter/material.dart';

class AboutNHA extends StatelessWidget {
  const AboutNHA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "About NHA",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
              '''National Health Authority (NHA) is the apex body responsible for implementing India’s flagship public health insurance/assurance scheme called “Ayushman Bharat Pradhan Mantri Jan Arogya Yojana” & has been entrusted with the role of designing strategy, building technological infrastructure and implementation of “National Digital Health Mission” to create a National Digital Health Eco-system.

National Health Authority is the successor of the National Health Agency, which was functioning as a registered society since 23rd May, 2018. Pursuant to Cabinet decision for full functional autonomy, National Health Agency was reconstituted as the National Health Authority on 2nd January 2019, under Gazette Notification Registered No. DL –(N) 04/0007/2003-18.

NHA has been set-up to implement PM-JAY, as it is popularly known, at the national level. An attached office of the Ministry of Health and Family Welfare with full functional autonomy, NHA is governed by a Governing Board chaired by the Union Minister for Health and Family Welfare. It is headed by a Chief Executive Officer (CEO), an officer of the rank of Secretary to the Government of India, who manages its affairs. The CEO is the Ex-Office Member Secretary of the Governing Board.

To implement the scheme at the State level, State Health Agencies (SHAs) in the form of a society/trust have been set up by respective States. SHAs have full operational autonomy over the implementation of the scheme in the State including extending the coverage to non SECC beneficiaries.

NHA is leading the implementation for national Digital Health Mission NDHM in coordination with different ministries/departments of the Government of India, State Governments, and private sector/civil society organizations.\n

Functions of NHA under PM-JAY\n

    Formulation of various operational guidelines related to PM-JAY, model documents and contracts to ensure standardization and interoperability.
    Determine the central ceiling for premium (or maximum central contribution for trusts) per family per year to be provided to the States/UTs and review it from time to time, based on field evidence and actuarial analysis.
    Develop and enforce compliance with standards for treatment protocols, quality protocols, minimum documentation protocols, data sharing protocols, data privacy and security protocols, fraud prevention and control including penal provisions etc.
    Develop mechanisms for strategic purchasing of health care services through PM-JAY, so as to get best return on Government’s investment. Create conducive conditions for strategic purchasing by preparing a list of packages and their rates and updating them from time to time using a transparent, predictable and evidence-based process.
    Set up effective and efficient mechanisms to pay to the health care providers.
    Set up systems and processes for convergence of PM-JAY with other health insurance/assurance schemes. This will include schemes being implemented by both State and Central Governments. National Health Authority will also develop a pathway to converge PM-JAY with schemes targeting workers from both, the formal and informal sectors.
    Build a state-of-the-art health information technology ecosystem with requisite foundational components on which PM-JAY and other health systems can be hosted/linked; Information Technology standards will be developed in consultation with Ministry of Electronic and Information Technology (MeitY).
    Explore options including ways to link PM-JAY with the larger health care system, especially primary care, in consultation with the Ministry of Health and Family Welfare, Government of India.
    Work closely with Insurance Regulatory and Development Authority on development and implementation of Health Insurance Regulations targeting insurance companies, Third Party Administrators, hospitals and other stakeholders.
    Effective implementation of PM-JAY across the country and its regular monitoring including taking course corrections actions, as and when required.
    Coordination with various State Governments on regular basis for implementation of PM-JAY.
    Capacity building of State Health Agencies and other stakeholders continuously.
    Carrying out awareness activities for informing beneficiaries and other stakeholders about the scheme.
    Prevention, detection and control of fraudulent activities and abuse.
    Grievance redressal for all the stakeholders at various levels.
    Set up an efficient monitoring system for the scheme.
    Stimulate cross learning, sharing of best practices amongst States and documentation of these practices.
    Ensure interoperability, standardization and convergence amongst schemes of Central Ministries.
    Conduct and facilitate policy relevant research and evaluation studies including knowledge sharing and information dissemination at the national and international level.
    Develop strategic partnerships and collaboration with Central and State Governments, other public and private institutions including not-for-profit institutions, banks, insurance companies, academic institutions such as universities, missions, think tanks, and other national and international bodies of repute in areas relevant to the objectives of PM-JAY.
    Generate evidence for the policy makers from schemes’ data and other research/evaluations so as to facilitate evidence-based decision making and policy formulation by the Government.
    Act as apex body for State Health Agencies that have been set up to implement PM-JAY.
    Take any decision related to the implementation of the scheme, recruitment rules and hiring of staff, disbursement of grant-in-aid to the States and issue relevant directions from time to time, as required.
    And all other activities as assigned by the Government of India from time to time.\n


Key responsibilities of NHA under NDHM\n

    Administrative and technical leadership to the National Digital Health Mission
    Propose policy directions as required to the Mission Steering Group, Empowered Committee and MoHFW
    Development of models for self-financing of National Digital Health Mission
    Implementation of policies and decision approved by the Mission Steering Group and Empowered Committee
    Coordination with MoHFW and the States/UTs
    Engagement with all stakeholders including private sector and civil society organizations, and develop strategic partnerships to achieve the objectives of NDHM
    Resolution of technical and operation issues
    Recruitment of resources from Government and private sector at competitive market rates
    Management of day-to-day operations of NDHM
    Capacity building of various stakeholders for health informatics


'''),
        ),
      ),
    );
  }
}
