#ifndef GCI_SRC_MOLPRO_GCI_SCHEDULE_SHAREDCOUNTERBASE_H
#define GCI_SRC_MOLPRO_GCI_SCHEDULE_SHAREDCOUNTERBASE_H

namespace molpro::gci::schedule {
/*!
 * @brief Base class for shared counters defining the interface.
 */
class SharedCounterBase {
public:
  SharedCounterBase() = default;
  SharedCounterBase(const SharedCounterBase &) = delete;
  virtual ~SharedCounterBase() = default;

  /*!
   * @brief increment the counter
   * @param amount how much to increment by
   * @return current value of the counter
   */
  virtual unsigned long int increment(int amount = 1) = 0;

  /*!
   * @brief Return current value from last call of increment
   */
  virtual unsigned long int current_value() { return m_curr_val; };

  /*!
   * @brief reset counter value to 0
   */
  virtual void reset() = 0;

protected:
  unsigned long int m_curr_val = 0; //! current value from last call of increment
};

}; // namespace molpro::gci::schedule

#endif // GCI_SRC_MOLPRO_GCI_SCHEDULE_SHAREDCOUNTERBASE_H
